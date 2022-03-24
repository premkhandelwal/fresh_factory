import 'package:flutter/material.dart';
import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/product_detail_page1.dart';

class TempPageForProduct extends StatefulWidget {
  const TempPageForProduct({ Key? key }) : super(key: key);

  @override
  _TempPageForProductState createState() => _TempPageForProductState();
  }
  
  class _TempPageForProductState extends State<TempPageForProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailPage()
                ),
              );
            },
            child: Text("Product Detail Page"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailPage1()
                ),
              );
            },
            child: Text("Product Detail Page 1"),
            style: ElevatedButton.styleFrom(),
          ),
          
        ],
      )),
    );
  }
}