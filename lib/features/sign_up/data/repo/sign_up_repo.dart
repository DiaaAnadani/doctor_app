
import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_app/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo( this.apiService);

  Future<ApiResult<SignUpResponse>> register(SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await apiService.register(signUpRequestBody);
      return ApiResult.success(response);
      
    }catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
      
    }
  }
}
