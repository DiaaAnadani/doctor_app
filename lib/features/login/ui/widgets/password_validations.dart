import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       buildValidationRow(text:  "At least 1 lower case letters", hasValidated: hasLowerCase),
       verticalSpacing(2.h),
        buildValidationRow(text: "At least 1 upper case letters", hasValidated: hasUpperCase,),
        verticalSpacing(2.h),
        buildValidationRow(text: "At least 1 special characters", hasValidated: hasSpecialCharacters,),
        verticalSpacing(2.h),
        buildValidationRow(text: "At least 1 number", hasValidated: hasNumber,),
        verticalSpacing(2.h),
        buildValidationRow(text: "At least 8 characters long", hasValidated: hasMinLength,),
      ],
    );
  }
}

Widget buildValidationRow({required String text, required bool hasValidated}) {
  return Row(children: [
    const CircleAvatar(
      radius: 2.5,
      backgroundColor: ColorsManager.gray,
    ),
    horizontalSpacing(6),
    Text(
      text,
      style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue),
    ),
  ]);
}
