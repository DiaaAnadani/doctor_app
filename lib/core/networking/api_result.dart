import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}


// import 'package:dartz/dartz.dart';

// Future<Either<String, int>> divideAsync(int a, int b) async {
//   await Future.delayed(Duration(seconds: 1)); // محاكاة عملية غير متزامنة
//   if (b == 0) {
//     return Left('Cannot divide by zero');
//   } else {
//     return Right(a ~/ b);
//   }
// }