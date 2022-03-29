import 'package:flutter/material.dart';

class DealofDayWidget extends StatelessWidget {
  const DealofDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(50),
      height: 141,
      width: 135,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
