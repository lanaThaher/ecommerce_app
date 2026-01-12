import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/home/data/models/check_out_model.dart';
import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:ecommerce_app/features/home/data/models/payment_model/payment_detailes_model.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class BillInfoView extends StatelessWidget {
  const BillInfoView({
    super.key,
    required this.paymentDetailesModel,
    required this.deliveryModel,
  });
  final PaymentDetailesModel paymentDetailesModel;
  final DeliveryModel deliveryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Billing'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Center(
            child: SizedBox(
              height: 300,
              width: 400,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: kPrimaryColor, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bill Info ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Subtotal: \$${paymentDetailesModel.subTotal.toStringAsFixed(2)}',
                        style: Styles.kTextStyle18,
                      ),
                      Text(
                        'Delivery: \$${paymentDetailesModel.deliveryCost.toStringAsFixed(2)}',
                        style: Styles.kTextStyle18,
                      ),
                      Text(
                        'Discount: -\$${paymentDetailesModel.discount.toStringAsFixed(2)}',
                        style: Styles.kTextStyle18,
                      ),
                      Text(
                        'Delivery: \$${paymentDetailesModel.total.toStringAsFixed(2)}',
                        style: Styles.kTextStyle18,
                      ),
                      Spacer(),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            var ordersBox = Hive.box<OrderModel>('ordersBox');
                            var cartBox = Hive.box<ProdectModel>('cartBox');

                            final newOrder = OrderModel(
                              delivery: deliveryModel,
                              id: DateTime.now().millisecondsSinceEpoch,
                              payments: paymentDetailesModel,
                              date: DateTime.now().toString().substring(0, 10),
                              status: 'Preparing',
                              items: cartBox.values.toList(),
                            );

                            await ordersBox.add(newOrder);
                            await cartBox.clear();

                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                            GoRouter.of(context).push(AppRouter.kOrdersStatus);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          child: Text(
                            'Payment',
                            style: Styles.kTextStyle22.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
