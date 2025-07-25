import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/home/logic/cubit/login_state.dart';
import 'package:doctor_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/models/login_response.dart';
import 'package:doctor_app/features/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailControllerCubit = TextEditingController();
  TextEditingController passwordControllerCubit = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(LoginRequestBody(
      email: emailControllerCubit.text,
      password: passwordControllerCubit.text,
    ));
    response.when(success: (LoginResponse loginResponse) {
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (error) {
      emit(LoginState.loginError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
