import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/features/home/data/models/navigation_item_model.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static final List<NavigationItemModel> navItems = [
    NavigationItemModel(
      icon: Icons.home,
      label: "Home",
      index: 0,
      route: AppRouter.kHomeView,
    ),
    NavigationItemModel(
      icon: Icons.shopping_bag,
      label: "orders",
      index: 1,
      route: AppRouter.kpaymentView,
    ),
    NavigationItemModel(
      icon: Icons.person,
      label: "Profile",
      index: 2,
      route: AppRouter.kProfileView,
    ),
  ];
}
