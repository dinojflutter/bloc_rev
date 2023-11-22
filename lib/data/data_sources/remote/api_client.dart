import 'dart:developer';

import 'package:bloc_revisions/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: Apiconstants.mainurl);
    dio = Dio(baseOptions);
  }

  Future<Response> getRequest({required String path}) async {
    try {
      // 404
      debugPrint("############## Api Request #############");
      debugPrint("Request Url:${baseOptions.baseUrl + path} ");
      var response = await dio.get(path);
      debugPrint("############## Api Response #############");
      debugPrint("Status Code :  ${response.statusCode.toString()}");
      log("Response data :  ${response.data}");
      return response;

      // debugPrint(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  ////post Request
  Future<Response> postRequest({required String path, dynamic body}) async {
    var token = await Utiles.getToken();
    final options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      // 404
      debugPrint("############## Api Request #############");
      debugPrint("Request Url:${baseOptions.baseUrl + path} ");
      debugPrint("body:$body");

      var response = await dio.post(path, data: body, options: options);
      debugPrint("############## Api Response #############");
      debugPrint("Status Code :  ${response.statusCode.toString()}");
      log("Response data :  ${response.data}");
      return response;

      // debugPrint(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
