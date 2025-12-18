import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';
import 'package:doctor_app/features/home/data/apis/home_api_service.dart';
import 'package:doctor_app/features/home/data/repos/home_repo.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/data/repo/login_repo.dart';
import 'package:doctor_app/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctor_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // dio & ApiService
  // dio  واعطائها لل ApiService توفير نسخة من
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login repo need ApiService
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //loginCubit need loginRepo
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup repo need ApiService
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //home repo
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  //getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
