import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorModel;
  const DoctorsListViewItem({super.key, this.doctorModel});

  @override
  Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    width: 110.w,
                    height: 120.h,
                    "assets/images/onboarding_doctor.png",
                    fit: BoxFit.cover,
                  ),
              
                ),
                horizontalSpacing(16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       doctorModel?.name ?? "Doctor Name",
                        style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpacing(5.h),
                      Text('${doctorModel?.degree}|${doctorModel?.phone}', style: TextStyles.font12GrayMedium),
                      verticalSpacing(5.h),
                      Text(doctorModel?.email ?? "Email", style: TextStyles.font12GrayMedium),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}