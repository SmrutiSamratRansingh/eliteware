import 'package:eliteware/core/helpers/toast_helper.dart';
import 'package:eliteware/features/login/views/signin_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      title: 'EliteWare Solutions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SigninScreen(),
    );
  }
}



//  "username": "kminchelle",
//  "password": "0lelplR"