import 'package:flutter/material.dart';

class ExclusiveOfferWidget extends StatelessWidget {
  const ExclusiveOfferWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(50),
      height: 161,
      width: 185,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
