import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 63.h,
          width: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bell Pepper Red",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(height: 3),
            Text(
              "1 kg Price",
              style: TextStyle(color: Colors.black26),
            ),
            SizedBox(height: 3),
            Text(
              "12-01-2022",
              style: TextStyle(color: Colors.black38),
            ),
            SizedBox(height: 7),
            Text(
              "\u{20B9}40.00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Text("Delivered"),
          color: Colors.green,
        )
      ],
    );
  }
}
