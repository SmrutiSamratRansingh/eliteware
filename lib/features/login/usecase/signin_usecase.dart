import 'package:eliteware/features/login/repository/signin_repository.dart';

class SigninUsecase {
  final Signinrepository signinRepository;

  SigninUsecase({required this.signinRepository});

  Future<int?> signin(String username, String password) async {
    try {
      return await signinRepository.signin(username, password);
    } catch (e) {
      rethrow;
    }
  }
}
