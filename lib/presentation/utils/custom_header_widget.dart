import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool isPaddingReq;
  const CustomHeaderWidget({
    Key? key,
    required this.title,
    this.fontSize = 20,
    this.isPaddingReq = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: isPaddingReq
              ? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15)
              : EdgeInsets.symmetric(),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: fontSize,
              
              // color: Colors.Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
