import 'package:flutter/material.dart';
import 'package:fresh/data/models/item.dart';

import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/product_detail_page1.dart';
import 'package:fresh/presentation/screens/products/product_detail_page2.dart';
import 'package:fresh/presentation/screens/products/product_detail_page3.dart';
import 'package:fresh/presentation/screens/products/product_detail_page4.dart';

class TempPageForProduct extends StatefulWidget {
  final Item item;
  const TempPageForProduct({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _TempPageForProductState createState() => _TempPageForProductState();
}

class _TempPageForProductState extends State<TempPageForProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductDetailPage()),
                );
              },
              child: Text("Product Detail Page"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductDetailPage1()),
                );
              },
              child: Text("Product Detail Page 1"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductDetailPage2()),
                );
              },
              child: Text("Product Detail Page 2"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductDetailPage3()),
                );
              },
              child: Text("Product Detail Page 3"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductDetailPage4(item: widget.item,)),
                );
              },
              child: Text("Product Detail Page 4"),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}
