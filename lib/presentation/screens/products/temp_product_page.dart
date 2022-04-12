import 'package:flutter/material.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/product_detail_page1.dart';
import 'package:fresh/presentation/screens/products/product_detail_page2.dart';
import 'package:fresh/presentation/screens/products/product_detail_page3.dart';
import 'package:fresh/presentation/screens/products/product_detail_page4.dart';

class TempPageForProduct extends StatefulWidget {
  static String route = '/tempPageForProductScreen';

  const TempPageForProduct({
    Key? key,
  }) : super(key: key);

  @override
  _TempPageForProductState createState() => _TempPageForProductState();
}

class _TempPageForProductState extends State<TempPageForProduct> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TempPageForProductArgs;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage.route,
                );
              },
              child: Text("Product Detail Page"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage1.route,
                );
              },
              child: Text("Product Detail Page 1"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage2.route,
                );
              },
              child: Text("Product Detail Page 2"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage3.route,
                );
              },
              child: Text("Product Detail Page 3"),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage4.route,
                  arguments: ProductDetailPage4Args(item: args.item)
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
