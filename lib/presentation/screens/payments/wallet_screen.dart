import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: currIndex == 0 ? "My Wallet" : "My Referral Wallet"),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: 10),
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
                      child: Text("My Wallet"),
                    ),
                    Tab(
                      child: Text("My Referral Wallet"),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                WalletWidget(),
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

class WalletWidget extends StatelessWidget {
  final bool isReferralWallet;
  const WalletWidget({
    this.isReferralWallet = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 158,
            width: 382,
            decoration: BoxDecoration(
              color: Color(0xff02096B),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_chart,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Your Balance",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 51,
                      ),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "\u{20B9}10,000.00",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 195,
            width: 382,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: Text(
                            "\u{20B9}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Money"),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(353, 49)),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardWidgetWallet(
                text:
                    isReferralWallet ? "Earning\nReport" : "Recharge\nHistory",
              ),
              CardWidgetWallet(
                  isRightSideWidget: true,
                  text: isReferralWallet
                      ? "WithDraw\nReport"
                      : "Billing\nHistory"),
            ],
          )
        ],
      ),
    );
  }
}

class CardWidgetWallet extends StatelessWidget {
  final bool isRightSideWidget;
  final String text;
  const CardWidgetWallet({
    this.isRightSideWidget = false,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: 177,
      color: Colors.indigo[100],
      child: Stack(
        //  alignment: MainAxisAlignment.spaceBetween,
        children: [
          Positioned(
            right: isRightSideWidget ? null : 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: const Icon(
                    Icons.account_box,
                    size: 35,
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
