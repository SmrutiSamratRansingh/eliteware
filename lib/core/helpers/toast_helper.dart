import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showToast(String message, {IconData? icon}) {
  final snackBar = SnackBar(
    margin: const EdgeInsets.only(bottom: 64, left: 20, right: 20),
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon),
          const SizedBox(width: 8),
        ],
        Expanded(
            child: Text(
          message == "null"
              ? "Your internet connection seems down at the moment"
              : message,
          style: const TextStyle(color: Color(0xff7588DF)),
        )),
      ],
    ),
    backgroundColor: const Color(0xffE6E5F1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    behavior: SnackBarBehavior.floating,
  );

  snackbarKey.currentState?.showSnackBar(snackBar);
}
