class TimerUsecase {
  Map<String, dynamic> getHourMinSec(int totalMinutes) {
    int hour = (totalMinutes / 60).truncate();
    int minutes = totalMinutes % 60;
    return {"hours": hour, "minutes": minutes};
  }

  Map<String, dynamic> reduceTimePeriodically(
      int hours, int minutes, int seconds) {
    if (seconds == 0 && minutes > 0) {
      seconds = 60;
      minutes--;
    }
    if (minutes == 0 && hours > 0) {
      minutes = 60;
      hours--;
    }
    if (seconds > 0) {
      seconds--;
    }

    return {"hours": hours, "minutes": minutes, "seconds": seconds};
  }
}
