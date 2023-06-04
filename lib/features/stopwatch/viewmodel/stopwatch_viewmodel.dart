import 'dart:async';
import 'package:eliteware/features/stopwatch/usecase/stopwatch_usecase.dart';
import 'package:flutter/material.dart';

class StopwaatchViewmodel extends ChangeNotifier {
  final StopwaatchUsecase timerUsecase;

  StopwaatchViewmodel({required this.timerUsecase});
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final timerData = timerUsecase.startTimer(seconds, minutes, hours);
      seconds = timerData["seconds"];
      minutes = timerData["minutes"];
      hours = timerData["hours"];
      notifyListeners();
    });
  }

  stopTimer() {
    timer?.cancel();
    notifyListeners();
  }

  resetTimer() {
    seconds = 0;
    minutes = 0;
    hours = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
