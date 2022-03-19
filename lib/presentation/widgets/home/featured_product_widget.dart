import 'package:flutter/material.dart';

class FeaturedProductsWidget extends StatelessWidget {
  const FeaturedProductsWidget({
    Key? key,
  }) : super(key: key);

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
