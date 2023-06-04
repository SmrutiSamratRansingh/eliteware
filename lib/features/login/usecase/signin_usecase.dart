import 'package:eliteware/features/login/repository/signin_repository.dart';

class SigninUsecase {
  final Signinrepository signinRepository;

  SigninUsecase({required this.signinRepository});

  signin(String username, String password) async {
    await signinRepository.signin(username, password);
  }
}
