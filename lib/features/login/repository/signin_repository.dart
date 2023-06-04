import 'package:eliteware/core/client/dio_client.dart';

class Signinrepository {
  signin(String username, String password) async {
    Map<String, dynamic> loginData = {
      "username": username,
      "password": password
    };
    return await DioClient.postRequest(loginData);
  }
}
