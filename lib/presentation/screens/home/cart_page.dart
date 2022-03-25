import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/presentation/screens/home/main_home_page.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart Page"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Stack(children: [
          Column(
            children: [
              CartItemWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),
              CartItemWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),
              CartItemWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),
              CartItemWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),
            ],
          ),
          Positioned(
            bottom: 1,
            left: 15,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Amount \u{20B9}140.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Proceed to checkout",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 12),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: CustomHeaderWidget(
                                              isPaddingReq: false,
                                              title: "Checkout")),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          icon: Icon(Icons.close))
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  CheckOutModalItemWidget(
                                    leftHeading: "Delivery",
                                    rightHeading: "Select Method",
                                  ),
                                  SizedBox(height: 10),
                                  CheckOutModalItemWidget(
                                    leftHeading: "Wallet",
                                    rightHeading: "\u{20B9} 1040.00",
                                  ),
                                  SizedBox(height: 10),
                                  CheckOutModalItemWidget(
                                    leftHeading: "Promo Code",
                                    rightHeading: "Pick Discount",
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => OfferPage()),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  CheckOutModalItemWidget(
                                    leftHeading: "Total Amount",
                                    rightHeading: "\u{20B9} 140.00",
                                  ),
                                  SizedBox(height: 40),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Place Order"),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(353, 50)),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(353, 65),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12)),
            ),
          ),
        ]),
      ),
    );
  }
}

class CheckOutModalItemWidget extends StatelessWidget {
  final String leftHeading;
  final String rightHeading;
  final void Function()? onTap;
  const CheckOutModalItemWidget(
      {Key? key,
      required this.leftHeading,
      required this.rightHeading,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(leftHeading)),
        GestureDetector(onTap: onTap, child: Text(rightHeading)),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: onTap,
        )
      ],
    );
  }
}

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int noOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 64,
              width: 70,
              decoration: BoxDecoration(color: Colors.grey),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Bell Pepper Red"),
                Text("1 Kg Price"),
                SizedBox(height: 10),
                Text("\u{20B9} 40.00")
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems -= 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff02096B))),
                      child: Text("-"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff02096B)),
                        color: const Color(0xff02096B)),
                    child: Text(
                      noOfItems.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems += 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff02096B))),
                      child: Text("+"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
