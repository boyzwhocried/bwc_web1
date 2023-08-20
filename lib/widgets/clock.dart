import 'dart:async';

import 'package:bwc_web1/utils/time_util.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String textToShow = '';
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    updateTextBasedOnTime();
  }

  void updateTextBasedOnTime() {
    DateTime now = DateTime.now();
    currentTime = "${now.hour}:${now.minute}:${now.second}";

    if (TimeUtil.isMorning(now)) {
      setState(() {
        textToShow = "Good morning!";
      });
    } else if (TimeUtil.isAfternoon(now)) {
      setState(() {
        textToShow = "Good afternoon!";
      });
    } else if (TimeUtil.isNight(now)) {
      setState(() {
        textToShow = "Good night!";
      });
    } else {
      setState(() {
        textToShow = "Hello!";
      });
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTextBasedOnTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textToShow,
        ),
        Text(
          "Current Time: $currentTime",
        ),
      ],
    );
  }
}
