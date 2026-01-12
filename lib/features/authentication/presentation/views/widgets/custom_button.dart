import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/size_config.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    return Container(
      width: SizeConfig.scale(60, context),
      // height: SizeConfig.scale(20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            kPrimaryColor,
          ), // Set your desired color here
        ),
        onPressed: onPressed,

        child: Text(
          text,
          style: Styles.kTextStyle20.copyWith(color: Colors.white),
        ),
        // style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
      ),
    );
  }
}
