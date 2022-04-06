import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final productBig = AssetImage("assets/product_detail_big.png");
  final productSmall = AssetImage("assets/product_detail_small.png");
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final imgList = [
      Image(image: productBig),
      Image(image: productBig),
    ];
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
              // mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: imgList,
                  options: CarouselOptions(
                      // height: 152,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.95,
                      // viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Positioned(
                  bottom: 3,
                  left: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: _current == entry.key ? 25.0 : 12,
                          height: _current == entry.key ? 12 : 18.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _current == entry.key
                                  ? Color(0xff02096B)
                                  : Colors.black54),
                        ),
                      );
                    }).toList(),
                  ),
                ),
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
                      width: 10,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.join_full,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "View Similar",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
                Divider(
                  height: 50,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Deliver to: ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "John.., 566016",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(width: 30),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey[350],
                        child: Text("Home"))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Akshaya Nagar 1st Block 1st Cross",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Change"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      color: Color(0xff02096B),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Delivery by 14 Mar, Monday",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.money_sharp,
                      color: Color(0xff02096B),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Cash on Delivery Available",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Similar Products",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 18)
                  ],
                ),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 10),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 10),
                      SizedBox(width: 10),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 10),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                    ],
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
