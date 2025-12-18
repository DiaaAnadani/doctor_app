import 'package:dio/dio.dart';
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
  static void addDioHeaders() {
    dio?.options.headers = {
      'Authorization': 'application/json',
      'Accept': 'application/json',
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
