import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/features/home/data/models/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';


@freezed
class HomeState with _$HomeState {
  //Specialization states
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(SpecializationResponseModel specializationResponseModel) = SpecializationsSuccess;
  const factory HomeState.specializationsErorr(ErrorHandler errorHandler) = SpecializationsErorr;
}
