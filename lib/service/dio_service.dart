import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants/api_constants.dart';

@immutable
sealed class DioService {
  static BaseOptions _baseOptions = BaseOptions();
  static Dio _dio = Dio();

  static Dio init() {
    _baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Constants.connectTimeOut,
      receiveTimeout: Constants.receiveTimeOut,
      headers: Constants.headers,
      responseType: ResponseType.json,
      validateStatus: (statusCode)=> statusCode! <= 205,
    );
    _dio = Dio(_baseOptions);
    return _dio;
  }

  static Future<Object?> getData(BuildContext context, String api, [Map<String, dynamic>param = const <String, dynamic>{}])async{
   try{
     Response response = await init().get(api, queryParameters: param);
     log("response String qaytishi kerak");
     log(response.data.toString());
     return jsonEncode(response.data);
   }on DioException catch(e){
     log("Error DioException");
     log(e.toString());
     return e;
   }
  }

  static Future<Object?> postData( String api,  Map<String, dynamic> data,[Map<String, dynamic> param= const <String, dynamic>{}]) async {
    try {
      Response response = await init().post(api, data: data, queryParameters: param);
      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        // Handle non-200 status codes here
        log('Non-200 status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle DioExceptions and other errors here
      log('Error in postData: $e');
      return null;
    }
  }

  static Future<String?> deleteData(BuildContext context, String api, String index, [Map<String, dynamic> param = const <String, dynamic>{}]) async {
    try {
      Response response = await init().delete("$api/$index", queryParameters: param);
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        // Handle non-200 status codes here
        log('Non-200 status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle DioExceptions and other errors here
      log('Error in deleteData: $e');
      return null;
    }
  }


}


