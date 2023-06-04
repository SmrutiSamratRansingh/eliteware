import 'package:eliteware/core/exceptions/ew_exception.dart';
import 'package:eliteware/core/helpers/toast_helper.dart';
import 'package:eliteware/features/login/usecase/signin_usecase.dart';
import 'package:flutter/material.dart';

class SigninViewmodel extends ChangeNotifier {
  final SigninUsecase signinUsecase;
  final userNameController = TextEditingController();
  bool isLoading = false;
  final passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  SigninViewmodel({required this.signinUsecase});

  Future<int?> signin() async {
    try {
      isLoading = true;
      notifyListeners();
      int? code = await signinUsecase.signin(
          userNameController.text, passController.text);
      isLoading = false;
      notifyListeners();
      return code;
    } on EwException catch (e) {
      isLoading = false;
      notifyListeners();
      showToast(e.message);
      return null;
    }
  }
}
