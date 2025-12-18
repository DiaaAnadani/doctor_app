import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key,required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList!.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(doctorModel: doctorsList![index]);
      
        },
      ),
    );
  }
}
