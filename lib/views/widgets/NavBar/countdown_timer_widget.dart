import 'dart:async';

import 'package:aaveg_app/utils/logger.dart';
import 'package:aaveg_app/views/widgets/NavBar/timer_widget.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  CountDownTimer({Key? key}) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? timer;
  Duration duration = Duration(days: 1, hours: 00, minutes: 00, seconds: 3);
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  var log = logger(CountDownTimer);
  var days, hours, minutes, seconds;
  late List<String> list = ["00 :", "00 :", "00 :", "00"];
  void addTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (mounted) {
      setState(() {
        var seconds = duration.inSeconds - 1;
        if (seconds < 0) {
          timer?.cancel();
          duration = Duration(seconds: 0);
        } else {
          duration = Duration(seconds: seconds);
        }
      });
      seconds = twoDigits(duration.inSeconds.remainder(60));
      minutes = twoDigits(duration.inMinutes.remainder(60));
      hours = twoDigits(duration.inHours.remainder(24));
      days = twoDigits(duration.inDays.remainder(30));
      list = [days + " :", hours + " :", minutes + " :", seconds];
      log.i('$days:$hours:$minutes:$seconds');
    }
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return TimerWidget(
      list: list,
      isCountdownn: true,
    );
  }
}
