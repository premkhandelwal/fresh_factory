import 'package:flutter/material.dart';
import 'dart:async';

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

//Update the time in 'YYYY-MM-DD HH:MM:SS' format
final eventTime = DateTime.parse('2022-03-19 15:41:00');

class _TimerAppState extends State<TimerApp> {
  static const duration =  Duration(seconds: 1);

  int timeDiff = eventTime.difference(DateTime.now()).inSeconds;

  Duration compare(DateTime x, DateTime y) {
    return Duration(
        microseconds:
            (x.microsecondsSinceEpoch - y.microsecondsSinceEpoch).abs());
  }

  Timer? timer;
  int days =0 ;
  int hours =0 ;
  int minutes =0 ;
  int seconds =0 ;

  void handleTick() {
    if (timeDiff > 0) {
      setState(() {
        if (eventTime != DateTime.now()) {
          DateTime x = DateTime.now();
          Duration diff = compare(x, eventTime);

          days = diff.inDays;
          hours= diff.inHours % 24;
          minutes = diff.inMinutes % 60;
          seconds = diff.inSeconds % 60 % 60;

          timeDiff = timeDiff - 1;
        } else {
          // print('Times up!');
          //Do something
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    timer ??= Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int days = timeDiff ~/ (24 * 60 * 60) % 24;
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Center(
          child:  Text('Countdown Timer'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabelText(
                    label: 'DAYS', value: days.toString().padLeft(2, '0')),
                LabelText(
                    label: 'HRS', value: hours.toString().padLeft(2, '0')),
                LabelText(
                    label: 'MIN', value: minutes.toString().padLeft(2, '0')),
                LabelText(
                    label: 'SEC', value: seconds.toString().padLeft(2, '0')),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
