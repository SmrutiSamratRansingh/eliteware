import 'package:eliteware/core/client/dio_client.dart';

class Signinrepository {
  Future<int?> signin(String username, String password) async {
    try {
      Map<String, dynamic> loginData = {
        "username": username,
        "password": password
      };
      return await DioClient.postRequest(loginData);
    } catch (e) {
      rethrow;
    }
  }
}
