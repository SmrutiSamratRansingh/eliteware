import 'package:eliteware/core/helpers/toast_helper.dart';
import 'package:eliteware/features/home/views/home.dart';
import 'package:eliteware/features/login/repository/signin_repository.dart';
import 'package:eliteware/features/login/usecase/signin_usecase.dart';
import 'package:eliteware/features/login/viewmodel/singin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SigninViewmodel>(
      create: ((context) => SigninViewmodel(
          signinUsecase: SigninUsecase(signinRepository: Signinrepository()))),
      child: const Signin(),
    );
  }
}

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinVm = context.watch<SigninViewmodel>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: signinVm.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                TextFormField(
                  validator: (val) =>
                      (val == "" ? 'This field is required' : null),
                  controller: signinVm.userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: "Enter user's name",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (val) =>
                      (val == "" ? 'This field is required' : null),
                  controller: signinVm.passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                signinVm.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          final nav = Navigator.of(context);
                          final siginVm = context.read<SigninViewmodel>();
                          if (signinVm.formKey.currentState!.validate()) {
                            int? statusCode = await siginVm.signin();
                            if (statusCode != null && statusCode == 200 ||
                                statusCode == 201) {
                              nav.pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                  (route) => false);
                            }
                          }
                        },
                        child: const Text("Signin"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
