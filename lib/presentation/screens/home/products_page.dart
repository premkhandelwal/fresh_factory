import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final sampleProduct = AssetImage('assets/sampleProduct.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits & Vegetable"),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff02096B),
        titleTextStyle: TextStyle(
            color: Color(0xff02096B),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomHeaderWidget(title: "Categories"),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoriesWidget(),
                      SizedBox(width: 5.w),
                      CategoriesWidget(),
                      SizedBox(width: 5.w),
                      CategoriesWidget(),
                      SizedBox(width: 5.w),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomCarouselWidget(),
              SizedBox(height: 20),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  ProductWidget(sampleProduct: sampleProduct),
                  ProductWidget(sampleProduct: sampleProduct),
                  ProductWidget(sampleProduct: sampleProduct),
                  ProductWidget(sampleProduct: sampleProduct)
      
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.sampleProduct,
  }) : super(key: key);

  final AssetImage sampleProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: 160.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),

          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38.h,
            width: 53.w,
            margin: EdgeInsets.fromLTRB(47, 30, 30, 0),
            child: Image(image: sampleProduct),
            decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Organic\nBananas",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "12pcs",
                      style: TextStyle(
                          color: Colors.grey[600], fontSize: 17),
                    ),
                    SizedBox(height: 7),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "MRP: \u{20B9}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14)),
                          TextSpan(
                            text: "40.00",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                decoration:
                                    TextDecoration.lineThrough,
                                decorationThickness: 3.5,
                                decorationColor: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\u{20B9}4.99",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(5, 25),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(height: 20),
                      CircleAvatar(
                        child: Icon(Icons.add,),
                        backgroundColor: Colors.green,
                      ) 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
