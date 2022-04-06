import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

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
            width: 413,
            height: 371,
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
                          width: 70,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image(image: productSmall),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "+3",
                            style: TextStyle(fontSize: 30, color: Colors.grey),
                          )),
                        ),
                        SizedBox(width: 10),
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
                    Expanded(
                        child: Text(
                      "1kg, Price",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )),
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
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // Colors.grey
                          border: Border.all(color: Color(0xFFBDBDBD)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text("1"),
                    ),
                    SizedBox(width: 15),
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
                  height: 30,
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
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet. Et repellat nemo qui sint consequatur eum provident nobis ut illum eligendi",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Divider(
                  height: 40,
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
                  height: 50,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(child: Text("Review")),
                    RatingBar(
                      initialRating: 4.5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      // ignoreGestures: true,
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
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Add to Basket"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(353, 65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
