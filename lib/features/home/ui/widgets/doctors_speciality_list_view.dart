import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationData?>? specializationsDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList!.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationData: specializationsDataList![index]!,
            itemIndex: index,
          );
        },
      ),
    );
  }
}
