import 'package:dio/dio.dart';
import 'package:doctor_app/core/helpers/constants_shared_keys.dart';
import 'package:doctor_app/core/helpers/shared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 150);
    if (dio == null) {
      dio=Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }
  static void addDioHeaders() async{
    dio?.options.headers = {
      'Authorization': 'Bearer ${await SharedPrefHelper.getString(ConstantsSharedKeys.userToken)}',
      'Accept': 'application/json',
    };
  }
static void 
setTokenAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
      
  static void addDioInterceptors() {
    dio?.interceptors.add(PrettyDioLogger(
        requestBody: true, 
        requestHeader: true,
        responseHeader: true)
        );
  }
}
