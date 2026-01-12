import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_order_stepper.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_stepper.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/item_detiles_custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailes extends StatelessWidget {
  const OrderDetailes({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Items",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderModel.items.length,
                itemBuilder: (context, index) {
                  return ItemDetailsCustomListTile(
                    ordersStatusModel: orderModel,
                    index: index,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Payment Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal"),
                        Text(
                          "\$${orderModel.payments.subTotal.toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Delivery"),
                        Text(
                          "\$${orderModel.payments.deliveryCost.toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${orderModel.payments.total.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Order Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CustomOrderStepper(order: orderModel),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Delivery Info",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address:"),
                        Text('${orderModel.delivery.address}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text("Street: "),
                        Text("${orderModel.delivery.street}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text("Building No: "),
                        Text("${orderModel.delivery.building}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
