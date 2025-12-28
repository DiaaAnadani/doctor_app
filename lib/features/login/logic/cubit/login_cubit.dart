import 'package:doctor_app/core/helpers/constants_shared_keys.dart';
import 'package:doctor_app/core/helpers/shared_preference.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';
import 'package:doctor_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/models/login_response.dart';
import 'package:doctor_app/features/login/data/repo/login_repo.dart';
import 'package:doctor_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    response.when(success: (LoginResponse loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (error) {
      emit(LoginState.loginError(error: error.apiErrorModel.message ?? ''));
    });
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(ConstantsSharedKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
   
  }
}
