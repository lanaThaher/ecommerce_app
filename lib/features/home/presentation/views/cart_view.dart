import 'package:flutter/material.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/data/models/payment_model/payment_detailes_model.dart';
import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/delivery_info.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  DeliveryModel? delivery;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<ProdectModel>('cartBox');

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<ProdectModel> cartBox, _) {
          if (cartBox.isEmpty) return Center(child: Text('Cart is empty'));

          double subtotal = 0;
          for (var item in cartBox.values) {
            subtotal += item.price * item.quantity;
          }

          double deliveryCost = 3.0;
          double discount = subtotal * 0.1;
          double total = subtotal + deliveryCost - discount;

          final paymentModel = PaymentDetailesModel(
            subTotal: subtotal,
            deliveryCost: deliveryCost,
            discount: discount,
            total: total,
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartBox.length,
                  itemBuilder: (context, index) {
                    final item = cartBox.getAt(index)!;
                    return ListTile(
                      leading: Image.network(item.image, width: 50),
                      title: Text(item.title),
                      subtitle: Text(
                        'Price: \$${item.price.toStringAsFixed(2)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (item.quantity > 1) {
                                item.quantity -= 1;
                                item.save();
                              } else {
                                item.delete();
                              }
                            },
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              item.quantity += 1;
                              item.save();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              DeliveryInfoWidget(
                delivery: delivery,
                onDeliveryChanged: (newDelivery) {
                  setState(() {
                    delivery = newDelivery;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                      style: Styles.kTextStyle18,
                    ),
                    Text(
                      'Delivery: \$${deliveryCost.toStringAsFixed(2)}',
                      style: Styles.kTextStyle18,
                    ),
                    Text(
                      'Discount: -\$${discount.toStringAsFixed(2)}',
                      style: Styles.kTextStyle18,
                    ),
                    Divider(height: 20, thickness: 2),
                    Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: Styles.kTextStyle18,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: delivery == null
                          ? null // disable if delivery not filled
                          : () {
                              GoRouter.of(context).push(
                                AppRouter.kBillInfo,
                                extra: {
                                  'payment': paymentModel,
                                  'delivery': delivery!,
                                },
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(
                        'Checkout',
                        style: Styles.kTextStyle22.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
