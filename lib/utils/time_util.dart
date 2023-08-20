class TimeUtil {
  static bool isMorning(DateTime time) {
    return time.hour >= 2 && time.hour < 10;
  }

  static bool isAfternoon(DateTime time) {
    return time.hour >= 10 && time.hour < 18;
  }

  static bool isNight(DateTime time) {
    return time.hour >= 18 && time.hour < 24 ||
        time.hour >= 24 && time.hour < 2;
  }
}

