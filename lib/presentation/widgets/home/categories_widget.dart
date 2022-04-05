import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/secrets.dart';

class CategoriesWidget extends StatelessWidget {
  final ItemCategory itemCategory;
  final Color borderColor;
  const CategoriesWidget({
    Key? key,
    required this.itemCategory,
    // this.bgColor = Colors.white,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(itemCategory.bannerImage != null){
      print(Secrets.host + itemCategory.bannerImage !);
    }
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
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
                ? Center(
                    child: Image.network(
                      itemCategory.bannerImage!.contains("media")
                          ? Secrets.host + itemCategory.bannerImage!
                          : Secrets.mediaUrl + itemCategory.bannerImage!,
                      height: 100,
                      width: 129,
                      errorBuilder: (ctx, _, _1) {
                        return Container(
                          height: 28,
                          width: 43,
                        );
                      },
                    ),
                  )
                : Container(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  itemCategory.name,
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* 

 */