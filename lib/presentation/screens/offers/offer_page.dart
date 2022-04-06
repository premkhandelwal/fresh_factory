import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final sampleProduct = AssetImage("assets/sampleProduct.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Offers"),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OffersSubWidget(
                  sampleProduct: sampleProduct, bgColor: Colors.green),
              SizedBox(height: 30),
              OffersSubWidget(
                  sampleProduct: sampleProduct, bgColor: Colors.red),
              SizedBox(height: 30),
              OffersSubWidget(
                  sampleProduct: sampleProduct, bgColor: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}

class OffersSubWidget extends StatelessWidget {
  final Color? bgColor;
  const OffersSubWidget({
    Key? key,
    required this.bgColor,
    required this.sampleProduct,
  }) : super(key: key);

  final AssetImage sampleProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 161,
          width: 346,
          color: bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Banana",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "10% off",
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(101, 15),
                        primary: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ],
              ),
              Image(
                image: sampleProduct,
                height: 88,
                width: 100,
              )
            ],
          ),
          // decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey)]),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 8,
          shadowColor: Colors.grey,
          child: Container(
            width: 346,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Banana 10% off",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  "Avaialable until 10th April 2022",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
