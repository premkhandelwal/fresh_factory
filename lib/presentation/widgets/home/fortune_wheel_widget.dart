import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class FortuneWheelWidget extends StatelessWidget {
  const FortuneWheelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        child: FortuneWheel(

                    animateFirst: false,
                    indicators: const [],
                    items: [
                      FortuneItem(
                          child: Container(
                        color: Colors.yellow,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.orange,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.red,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.yellow,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.red,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.orange,
                      )),
                      FortuneItem(
                          child: Container(
                        color: Colors.green,
                      )),
                    ],
                  ),
      ),
    );
  }
}
