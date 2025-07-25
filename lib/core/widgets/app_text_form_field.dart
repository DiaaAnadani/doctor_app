import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {required this.hintText,
      this.suffixIcon,
      super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enableBorder,
      this.inputTextStyle,
      this.hintStyle,
      this.fillColor,
      this.isObscureText,
      this.controller,
      required this.validator});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(15),
            ),
        enabledBorder: enableBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lightGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintStyle: hintStyle ?? TextStyles.font14lightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? ColorsManager.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14darkBlueMedium,
      validator: (String? value) {
        return validator(value);
      },
    );
  }
}
