import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
 const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHight,
      required this.textButton,
      required this.textStyle,
      required this.onPressed});

  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHight;
  final String textButton;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? ColorsManager.mainBlue),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.0.w,
            vertical: verticalPadding?.h ?? 14.0.h)),
        fixedSize: MaterialStateProperty.all(Size(buttonWidth?.w ?? double.maxFinite,buttonHight ?? 52.h)),
      ),
      child: Text(textButton, style: textStyle),
    );
  }
}
