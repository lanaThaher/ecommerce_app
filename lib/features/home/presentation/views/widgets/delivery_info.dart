import 'package:flutter/material.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'custom_show_dialog.dart';

class DeliveryInfoWidget extends StatefulWidget {
  final DeliveryModel? delivery;
  final ValueChanged<DeliveryModel> onDeliveryChanged;

  const DeliveryInfoWidget({
    super.key,
    this.delivery,
    required this.onDeliveryChanged,
  });

  @override
  State<DeliveryInfoWidget> createState() => _DeliveryInfoWidgetState();
}

class _DeliveryInfoWidgetState extends State<DeliveryInfoWidget> {
  DeliveryModel? delivery;

  @override
  void initState() {
    super.initState();
    delivery = widget.delivery;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Delivery info', style: Styles.kTextStyle20),
              const SizedBox(width: 10),
              Icon(
                Icons.check_circle,
                color: delivery != null ? Colors.green : Colors.grey,
                size: 30,
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              final result = await showDeliveryInfoDialog(context);
              if (result != null) {
                final newDelivery = DeliveryModel(
                  address: result['address']!,
                  street: result['street']!,
                  building: int.tryParse(result['building']!) ?? 0,
                );

                setState(() {
                  delivery = newDelivery;
                });

                widget.onDeliveryChanged(newDelivery);
              }
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
