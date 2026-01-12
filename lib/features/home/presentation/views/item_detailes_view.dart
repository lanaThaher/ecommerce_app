import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/order.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetailesView extends StatelessWidget {
  const ItemDetailesView({super.key, required this.prodectModel});
  final ProdectModel prodectModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.4,
                      child: Image.network(
                        prodectModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(prodectModel.title, style: Styles.kTextStyle28),
                          Text(
                            prodectModel.description,
                            style: Styles.kTextStyle18,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  SizedBox(width: 10),
                                  Text(prodectModel.rating.rate.toString()),
                                ],
                              ),
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text(prodectModel.rating.count.toString()),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${prodectModel.price.toString()}',
                                style: Styles.kTextStyle32,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                width: MediaQuery.of(context).size.width * .35,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Order().addToCart(prodectModel);

                                    // Navigate to CartView
                                    GoRouter.of(
                                      context,
                                    ).push(AppRouter.kCartView);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  child: Text(
                                    'Add to cart',
                                    style: Styles.kTextStyle20.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  children: [
                    CustomAppBar(),
                    Image.network(
                      prodectModel.image,
                      width: constraints.maxWidth * .5,
                    ),
                    Text(prodectModel.title, style: Styles.kTextStyle22),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        prodectModel.description,
                        style: Styles.kTextStyle18,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 10),
                            Text(prodectModel.rating.rate.toString()),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 10),
                            Text(prodectModel.rating.count.toString()),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '\$ ${prodectModel.price.toString()}',
                          style: Styles.kTextStyle24,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              // Show loading dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              );

                              Order().addToCart(prodectModel);

                              await Future.delayed(Duration(seconds: 3));

                              Navigator.of(context).pop();

                              GoRouter.of(context).push(AppRouter.kCartView);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                            ),
                            child: Text(
                              'Add to cart',
                              style: Styles.kTextStyle20.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
