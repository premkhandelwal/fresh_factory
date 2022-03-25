import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/globals.dart';

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
          // color: bgColor,
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          itemCategory.bannerImage != null
              ? Image.network(
                  Globals.host + itemCategory.bannerImage!,
                  height: 100,
                  width: 129,
                )
              : Container(),
          Center(
              child: Text(
            itemCategory.name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          )),
        ],
      ),
    );
  }
}
