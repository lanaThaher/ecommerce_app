import 'package:ecommerce_app/core/utils/functions/api_services/all_prodect_services.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProdectModel>>(
      future: AllProdectServices().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProdectModel> products = snapshot.data!;
          return GridView.builder(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 9,
              mainAxisSpacing: 20,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CustomCard(prodectModel: products[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
