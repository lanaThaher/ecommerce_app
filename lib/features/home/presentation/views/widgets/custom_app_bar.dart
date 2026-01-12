import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        Text('Discover', style: Styles.kTextStyle22),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
          icon: Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}
