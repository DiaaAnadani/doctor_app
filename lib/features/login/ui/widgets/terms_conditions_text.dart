import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:flutter/material.dart';


class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By logging up, you agree to our ",
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: "Terms & Conditions",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: " and ",
            //height =1.5 to give more space between two lines
            style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
