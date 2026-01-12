import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  // static void init(BuildContext context) {
  //   screenWidth = MediaQuery.of(context).size.width;
  //   screenHeight = MediaQuery.of(context).size.height;
  //   blockSizeHorizontal = screenWidth! / 100;
  //   blockSizeVertical = screenHeight! / 100;
  // }

  static double scale(double size, BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    return size * blockSizeHorizontal!;
  }
}
