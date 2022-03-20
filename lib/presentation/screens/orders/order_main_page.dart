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
  final noOrderImage = AssetImage('assets/noCurrentOrders.png');
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
                // WalletWidget(),
                Column(
                  children: [
                    Image(image: noOrderImage),
                     RichText(
            text: TextSpan(
              text: 'Hello ',
              // style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: 'There is no ongoing order right now.', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
                    RichText(
                      
                        text: TextSpan(children: [
                      TextSpan(
                        style: TextStyle(fontSize: 20),
                          text:
                              "There is no ongoing order right now.\nYou can order from home"),
                               TextSpan(
                          text:
                              "There is no ongoing order right now.\nYou can order from home")
                    ]))
                  ],
                ),
                WalletWidget(
                  isReferralWallet: true,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
