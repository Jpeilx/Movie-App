import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final String statusCode;
  final String statusMessage;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});
  factory ErrorMessageModel.fromjson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          statusCode: json['status_code'],
          statusMessage: json['status_message'],
          success: json['success']);

  @override

  List<Object?> get props => [statusCode, success, statusMessage];
}
