class StopwaatchUsecase {
  Map<String, dynamic> startTimer(int seconds, int minutes, int hours) {
    seconds = seconds + 1;
    if (seconds == 60) {
      minutes = minutes + 1;
      seconds = 0;
    }
    if (minutes == 60) {
      hours = hours + 1;
      minutes = 0;
    }

    return {"seconds": seconds, "minutes": minutes, "hours": hours};
  }
}
