import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrdersStatusView extends StatelessWidget {
  const OrdersStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    var ordersBox = Hive.box<OrderModel>('ordersBox');

    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ValueListenableBuilder(
        valueListenable: ordersBox.listenable(),
        builder: (context, Box<OrderModel> box, _) {
          if (box.isEmpty) {
            return Center(child: Text("No orders yet"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: box.length,
            itemBuilder: (context, index) {
              final order = box.getAt(index)!;
              return GestureDetector(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kOrderDetailes, extra: order);
                },
                child: CustomOrderItemStatus(orderStatusModel: order),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomOrderItemStatus extends StatelessWidget {
  const CustomOrderItemStatus({super.key, required this.orderStatusModel});

  final OrderModel orderStatusModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
        border: Border.all(color: kPrimaryColor, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #${orderStatusModel.id}",
                  style: Styles.kTextStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  orderStatusModel.date,
                  style: Styles.kTextStyle18.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),

            Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.orange, size: 20),
                const SizedBox(width: 6),
                Text(
                  orderStatusModel.status,
                  style: Styles.kTextStyle18.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const Divider(height: 24, thickness: 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: Styles.kTextStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${orderStatusModel.payments.total.toStringAsFixed(2)}",
                  style: Styles.kTextStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
