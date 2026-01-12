import 'package:flutter/material.dart';

class NavigationItemModel {
  final IconData icon;
  final String label;
  final int index;
  final String route;

  NavigationItemModel({
    required this.route,
    required this.icon,
    required this.label,
    required this.index,
  });
}
