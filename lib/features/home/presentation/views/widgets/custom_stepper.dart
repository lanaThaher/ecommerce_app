import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomOrderStepper extends StatelessWidget {
  final OrderModel order;

  const CustomOrderStepper({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    int currentStep = _mapStatusToStep(order.status);

    DateTime baseDate = DateTime.parse(order.date);

    List<Map<String, dynamic>> steps = [
      {
        "label": "Preparing",
        "icon": Icons.inventory,
        "date": baseDate,
        "statusId": 1,
      },
      {
        "label": "Delivery",
        "icon": Icons.local_shipping,
        "date": baseDate.add(const Duration(days: 3)),
        "statusId": 2,
      },
      {
        "label": "Delivered",
        "icon": Icons.check_circle,
        "date": baseDate.add(const Duration(days: 5)),
        "statusId": 3,
      },
    ];

    return Column(
      children: List.generate(steps.length, (index) {
        bool isActive = index == currentStep;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  steps[index]["icon"],
                  color: isActive ? Colors.green : Colors.grey,
                  size: 30,
                ),
                if (index != steps.length - 1)
                  Container(height: 40, width: 2, color: Colors.grey),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps[index]["label"],
                      style: TextStyle(
                        color: isActive ? Colors.green : Colors.grey,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Text(
                      DateFormat(
                        "MMM dd ,hh:mm a",
                      ).format(steps[index]["date"]),
                      style: TextStyle(
                        fontSize: 12,
                        color: isActive ? Colors.green : Colors.grey,
                      ),
                    ),
                    // Text(
                    //   'Status ID: ${steps[index]["statusId"]}', // optional display
                    //   style: const TextStyle(
                    //     fontSize: 10,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  int _mapStatusToStep(String status) {
    switch (status) {
      case "Preparing":
        return 0;
      case "Delivery":
        return 1;
      case "Delivered":
        return 2;
      default:
        return 0;
    }
  }
}
