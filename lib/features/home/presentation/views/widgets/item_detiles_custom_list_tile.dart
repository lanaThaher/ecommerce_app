import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:flutter/material.dart';

class ItemDetailsCustomListTile extends StatelessWidget {
  const ItemDetailsCustomListTile({
    super.key,
    required this.ordersStatusModel,
    required this.index,
  });

  final OrderModel ordersStatusModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(
            ordersStatusModel.items[index].image,
            width: 50,
          ),
          title: Text(ordersStatusModel.items[index].title),
          trailing: Text(
            '\$${ordersStatusModel.items[index].price.toString()}',
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
