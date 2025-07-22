import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
                stops: [
                  0.14,
                  4.0
                ]),
          ),
          child: Image.asset("assets/images/onboarding_doctor.png"),
        ),
        Positioned(
            bottom: 30.h,
            left: 0.0,
            right: 0.0,
            child: Text("Best doctor Appointment App",
                textAlign: TextAlign.center, style: TextStyles.font32BlodBMainBlue.copyWith(height: 1.5)))
      ],
    );
  }
}
