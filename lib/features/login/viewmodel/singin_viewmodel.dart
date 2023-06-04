import 'package:eliteware/features/login/usecase/signin_usecase.dart';
import 'package:flutter/material.dart';

class SigninViewmodel extends ChangeNotifier {
  final SigninUsecase signinUsecase;
  final userEmailController = TextEditingController();
  bool isLoading = false;
  final passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  SigninViewmodel({required this.signinUsecase});

  signin() async {
    return await signinUsecase.signin(
        userEmailController.text, passController.text);
  }
}
