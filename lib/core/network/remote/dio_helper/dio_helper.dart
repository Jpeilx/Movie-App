
import 'package:dio/dio.dart';
import 'package:movie/core/utils/app_constant.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstance.apiBaseUrl,
        receiveDataWhenStatusError: true,
       
      ),
    );
  }

  static Future<Response> getdata({
    required String endPoint,
    Map<String , dynamic> ?query,
    String lang = 'en-US' ,
    
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang , 
       
    } ;
    return await dio.get(endPoint, queryParameters: query);
  }

  static Future<Response> postdata({
    required String endPoint,
    required data,
    query,
    String lang = 'en-US' ,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang , 
      
    } ;
    return await dio.post( endPoint , queryParameters: query, data: data);
  }
  static Future<Response> putdata({
    required String endPoint,
    required data,
    query,
    String lang = 'en-US' ,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang ,  
    } ;
    return await dio.put( endPoint , queryParameters: query, data: data);
  }
}
