import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            )),
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.w,
              )),
        )
      ],
    );
  }
}
