
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/home/data/repos/home_repo.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  void getSpecialization() async {
    emit(HomeState.specializationsLoading());
    final response = await homeRepo.getSpecialization();
    response.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationsSuccess(specializationResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsErorr(errorHandler));
      },
    );
  }
}
