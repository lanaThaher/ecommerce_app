import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.prodectModel});
  final ProdectModel prodectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 2.0,
            color: Colors.grey.withOpacity(.5),
            offset: const Offset(5.0, 5.0),
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    prodectModel.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://picsum.photos/250?image=9',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Title
              Text(
                prodectModel.title.length > 8
                    ? prodectModel.title.substring(0, 8) + "..."
                    : prodectModel.title,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 3),

              /// Price + Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'$'
                    '${prodectModel.price.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.favorite, color: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
