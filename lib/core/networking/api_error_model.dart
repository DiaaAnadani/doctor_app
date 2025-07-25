import 'package:json_annotation/json_annotation.dart';
//   flutter pub run build_runner build String? message;
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
