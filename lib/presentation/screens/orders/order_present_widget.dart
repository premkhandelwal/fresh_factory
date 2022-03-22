import 'package:flutter/material.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';

class OrderPresentWidget extends StatelessWidget {
  const OrderPresentWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order1 = AssetImage('assets/order1.png');
  final order2 = AssetImage('assets/order2.png');
  final order3 = AssetImage('assets/order3.png');
  final order4 = AssetImage('assets/order4.png');
  final order5 = AssetImage('assets/order5.png');
    return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                              height: 55,
                              width: 412,
                              color: Colors.indigo[100],
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.calendar_month),
                                      onPressed: () {}),
                                  Text(" March 5, 2019"),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("6.30 PM"),
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    children: [
                                      OrderTrackWidget(
                                        stepCompleted: true,
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -30),
                                        child: OrderTrackWidget(
                                          stepCompleted: true,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -60),
                                        child: OrderTrackWidget(
                                          stepCompleted: true,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -90),
                                        child: OrderTrackWidget(
                                          stepCompleted: true,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -125),
                                        child: OrderTrackWidget(
                                          stepCompleted: true,
                                          lineLength: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: order1,
                                            ),
                                            SizedBox(width: 25),
                                            Text("Your Order is Processing...",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: order2,
                                            ),
                                            SizedBox(width: 25),
                                            Text("Your Order is Approved..  ",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: order3,
                                            ),
                                            SizedBox(width: 25),
                                            Text("We are packing your items...",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: order4,
                                            ),
                                            SizedBox(width: 25),
                                            Text(
                                                "Your order is delivering to\nyour location...",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 60),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: order5,
                                            ),
                                            SizedBox(width: 25),
                                            Text("Your Order is Recieved...",
                                                style: TextStyle(fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
  }
}