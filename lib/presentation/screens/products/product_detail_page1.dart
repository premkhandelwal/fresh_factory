import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class ProductDetailPage1 extends StatefulWidget {
  const ProductDetailPage1({Key? key}) : super(key: key);

  @override
  _ProductDetailPage1State createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1> {
  final productBig = AssetImage("assets/product_detail_big.png");
  final productSmall = AssetImage("assets/product_detail_small.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Vegetables"),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 413.w,
            height: 371.h,
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Stack(
              children: [
                Image(image: productBig),
                Positioned(
                    bottom: 30,
                    left: 20,
                    child: Row(
                      children: [
                        Container(
                          width: 70.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          width: 70.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          width: 70.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          width: 70.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("+3", style: TextStyle(fontSize: 30, color: Colors.grey),)),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Natural Red Apple",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Row(
                  children: [
                    RatingBar(
                      initialRating: 4.5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemSize: 20,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          half: Icon(
                            Icons.star_half,
                            color: Colors.orange,
                          ),
                          empty: Icon(
                            Icons.star_border,
                            color: Colors.orange,
                          )) /* Icon(
     Icons.star,
     color: Colors.amber,
   ) */
                      ,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(child: Text("4.5")),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "-",
                      style: TextStyle(fontSize: 60, color: Colors.grey),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // Colors.grey
                          border: Border.all(color: Color(0xFFBDBDBD)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text("1"),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Text(
                      "\u{20B9}140.00",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                Divider(
                  height: 30.h,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Highlights",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: 35,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Lorem ipsum dolor sit amet. Et repellat nemo qui sint consequatur eum provident nobis ut illum eligendi",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Divider(
                  height: 40.h,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "All Offers & Coupons",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
                Divider(
                  height: 50.h,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text("Review")
                  ],
                )              ],
            ),
          )
        ],
      ),
    );
  }
}
