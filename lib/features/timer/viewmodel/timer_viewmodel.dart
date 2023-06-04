import 'dart:async';

import 'package:eliteware/features/timer/usecase/timer_usecase.dart';
import 'package:flutter/material.dart';

class TimerViewmodel extends ChangeNotifier {
  final TimerUsecase stopwatchUsecase;
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  TimerViewmodel({required this.stopwatchUsecase});
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;

  beginStopwatch() {
    int totalMinutes = int.parse(controller.text.trim());
    Map<String, dynamic> totalTimerData =
        stopwatchUsecase.getHourMinSec(totalMinutes);
    hours = totalTimerData["hours"];
    minutes = totalTimerData["minutes"];
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Map<String, dynamic> currentTimerData =
          stopwatchUsecase.reduceTimePeriodically(hours, minutes, seconds);
      hours = currentTimerData["hours"];
      minutes = currentTimerData["minutes"];
      seconds = currentTimerData["seconds"];
      notifyListeners();
      if (hours == 0 && minutes == 0 && seconds == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
