import 'package:movie/core/network/remote/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({required this.errorMessageModel});
}
class DataBaseException implements Exception {
  final String message ; 
  DataBaseException({required this.message});
}
