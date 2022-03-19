import 'package:flutter/material.dart';

class BrandsWidget extends StatelessWidget {
  const BrandsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        // border: Border.all(width: 20)
      ),
    );
  }
}