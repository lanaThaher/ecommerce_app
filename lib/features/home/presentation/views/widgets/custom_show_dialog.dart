import 'package:flutter/material.dart';

Future<Map<String, String>?> showDeliveryInfoDialog(
  BuildContext context,
) async {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();

  return showDialog<Map<String, String>>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text('Delivery Information'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: streetController,
                decoration: InputDecoration(labelText: 'Street'),
              ),
              TextField(
                controller: buildingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Building Number'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (addressController.text.isEmpty ||
                  streetController.text.isEmpty ||
                  buildingController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all fields')),
                );
                return;
              }

              Navigator.of(context).pop({
                'address': addressController.text,
                'street': streetController.text,
                'building': buildingController.text,
              });
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}
