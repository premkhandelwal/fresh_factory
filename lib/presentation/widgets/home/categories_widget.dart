import 'package:flutter/material.dart';

import 'package:fresh/data/models/item_categories.dart';

class CategoriesWidget extends StatelessWidget {
  final ItemCategory itemCategory;
  final Color? bgColor;
  final Color borderColor;
  const CategoriesWidget({
    Key? key,
    required this.itemCategory,
    this.bgColor = Colors.white,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(50),
      height: 131,
      width: 129,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Center(
          child: Text(
        itemCategory.name,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      )),
    );
  }
}
