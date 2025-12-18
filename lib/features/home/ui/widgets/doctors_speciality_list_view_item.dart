import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationData specializationData;
  final int itemIndex;
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.itemIndex,
    required this.specializationData
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 15.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
              "assets/svgs/general_speciality.svg",
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpacing(8.h),
          Text(specializationData.name?? "Specialization", style: TextStyles.font12DarkBlueRegular),
        ],
      ),
    );
  }
}
