import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/presentation/screens/payments/wallet_screen.dart';

class OrderMainPage extends StatefulWidget {
  const OrderMainPage({Key? key}) : super(key: key);

  @override
  State<OrderMainPage> createState() => _OrderMainPageState();
}

class _OrderMainPageState extends State<OrderMainPage> {
  int currIndex = 0;
  bool orderPresent = false;
  final noOrderImage = AssetImage('assets/noCurrentOrders.png');
  final order1 = AssetImage('assets/order1.png');
  final order2 = AssetImage('assets/order2.png');
  final order3 = AssetImage('assets/order3.png');
  final order4 = AssetImage('assets/order4.png');
  final order5 = AssetImage('assets/order5.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff02096B),
        titleTextStyle: TextStyle(
            color: Color(0xff02096B),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xff02096B),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
// backgroundBlendMode:
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.indigo),
                  onTap: (index) {
                    // Tab index when user select it, it start from zero
                    setState(() {
                      currIndex = index;
                    });
                  },
                  tabs: const [
                    Tab(
                      child: Text("Status"),
                    ),
                    Tab(
                      child: Text("History"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                orderPresent
                    ? SingleChildScrollView(
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
                      )
                    : Column(
                        children: [
                          Image(image: noOrderImage),
                          Text('There is no ongoing order right now.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff02096B))),
                          SizedBox(height: 10),
                          Text('You can order from home',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff02096B))),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(fontSize: 20),
                                text:
                                    "There is no ongoing order right now.\nYou can order from home"),
                            TextSpan(
                                text:
                                    "There is no ongoing order right now.\nYou can order from home")
                          ])),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                orderPresent = true;
                              });
                            },
                            child: Text("Change Status"),
                            style: ElevatedButton.styleFrom(),
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      HistoryItemWidget(),
                      Divider(
                        height: 40,
                      ),
                      HistoryItemWidget(),
                      Divider(
                        height: 40,
                      ),
                      HistoryItemWidget(),
                      Divider(
                        height: 40,
                      ),
                      HistoryItemWidget(),
                       Divider(
                        height: 40,
                      ),
                    ],
                  ),
                )
                /* LisView.builder(itemBuilder: ((context, index) {
                        return ListTile();
                      }))
 */
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 63.h,
          width: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bell Pepper Red",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(height: 3),
            Text(
              "1 kg Price",
              style: TextStyle(color: Colors.black26),
            ),
            SizedBox(height: 3),
            Text(
              "12-01-2022",
              style: TextStyle(color: Colors.black38),
            ),
            SizedBox(height: 7),
            Text(
              "\u{20B9}40.00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Text("Delivered"),
          color: Colors.green,
        )
      ],
    );
  }
}

class OrderTrackWidget extends StatelessWidget {
  final bool stepCompleted;
  final int lineLength;
  const OrderTrackWidget({
    Key? key,
    required this.stepCompleted,
    this.lineLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
          value: stepCompleted,
          onChanged: (val) {},
          shape: CircleBorder(),
        ),
        // SizedBox(height: 0),
        Transform.translate(
          offset: Offset(0, -10),
          child: DottedLine(
            direction: Axis.vertical,
            lineLength: lineLength.h,
          ),
        ),
      ],
    );
  }
}
