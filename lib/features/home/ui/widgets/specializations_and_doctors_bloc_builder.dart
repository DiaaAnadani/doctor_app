import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsErorr ||
          current is SpecializationsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsErorr: (errorHandler) => setupError(),
          specializationsSuccess: (specializationResponseModel) {
            var specializationsList =
                specializationResponseModel.specializationDataList;
             return setupSuccess( specializationsList);
         
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
      return SizedBox(
              height: 100.h,
              child: const Center(child: CircularProgressIndicator()),
            );
  }
  Widget setupSuccess(specializationsList) {
     return Expanded(
              child: Column(
                children: [
                  DoctorsSpecialityListView(
                    specializationsDataList: specializationsList ?? [],
                  ),
                  verticalSpacing(8.h),
                  DoctorsListView(
                    doctorsList: specializationsList?[0].doctorsList,
                  ),
                ],
              ),
            );
  }
  Widget setupError() {
    return SizedBox.shrink();
  }
}
