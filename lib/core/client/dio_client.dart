import 'package:dio/dio.dart';
import 'package:eliteware/core/helpers/print_helper.dart';
import 'package:eliteware/core/interceptors/dio_interceptors.dart';

class DioClient {
  static Future<int?> postRequest(Map<String, dynamic> loginData) async {
    try {
      final options = BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      );
      Dio dio = Dio(options);
      dio.interceptors.add(CustomInterceptors());
      const String loginUrl = "/auth/login";
      final response = await dio.post(loginUrl, data: loginData);
      return response.statusCode;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        printDebug(e.response!.data);
        printDebug(e.response!.headers);
        printDebug(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        printDebug(e.requestOptions);
        printDebug(e.message);
      }
      return e.response!.statusCode;
    }
  }
}
