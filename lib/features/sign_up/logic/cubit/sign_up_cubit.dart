import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_app/features/sign_up/data/models/sign_up_response.dart';
import 'package:doctor_app/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctor_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameControllerCubit = TextEditingController();
  TextEditingController emailControllerCubit = TextEditingController();
  TextEditingController phoneControllerCubit = TextEditingController();
  TextEditingController passwordControllerCubit = TextEditingController();
  TextEditingController passwordConfirmationControllerCubit =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signupRepo.register(SignUpRequestBody(
      email: emailControllerCubit.text,
      name: nameControllerCubit.text,
      phone: phoneControllerCubit.text,
      password: passwordControllerCubit.text,
      passwordConfirmation: passwordConfirmationControllerCubit.text,
      gender: 0,
    ));
    response.when(success: (SignUpResponse signUpResponse) {
      emit(SignUpState.signupSuccess(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
