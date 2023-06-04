import 'package:dio/dio.dart';
import 'package:eliteware/core/exceptions/ew_exception.dart';
import 'package:eliteware/core/helpers/toast_helper.dart';
import 'package:eliteware/core/interceptors/dio_interceptors.dart';
import 'package:flutter/material.dart';

class DioClient {
  static Future<int?> postRequest(Map<String, dynamic> loginData) async {
    try {
      final options = BaseOptions(
        // baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      );
      Dio dio = Dio(options);
      dio.interceptors.add(CustomInterceptors());
      const String loginUrl = "https://dummyjson.com/auth/login";
      final response = await dio.post(loginUrl, data: loginData);
      print(response.statusCode);
      return response.statusCode;
    } on DioError catch (e) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectionTimeout == e.type ||
          DioErrorType.unknown == e.type) {
        throw EwException(
            "Server is not reachable. Please verify your internet connection and try again");
      } else if (e.response!.data["message"] == "Invalid credentials") {
        throw EwException("Enter username and/or password is incorrect.");
      }

      throw EwException("Server not responding.");
    }
  }
}
