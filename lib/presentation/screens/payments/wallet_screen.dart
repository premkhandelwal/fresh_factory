import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/radioButtonCubit/radio_button_cubit.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/enums.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:fresh/presentation/screens/reports/billing_history_page.dart';
import 'package:fresh/presentation/screens/reports/earning_report_page.dart';
import 'package:fresh/presentation/screens/reports/recharge_history_page.dart';
import 'package:fresh/presentation/screens/reports/withdraw_report_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fresh/businessLogic/cubits/payCubit/pay_cubit.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class WalletScreen extends StatefulWidget {
  static String route = '/walletScreen';

  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int currIndex = 0;

  final walletController = TextEditingController();
  final referralWalletController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = WalletScreenArgs(isRedirectedAutomatically: false);
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
            Expanded(
              child: TabBarView(children: [
                WalletWidget(
                    controller: walletController,
                    isRedirectedAutomatically: args.isRedirectedAutomatically),
                WalletWidget(
                  isReferralWallet: true,
                  isRedirectedAutomatically: args.isRedirectedAutomatically,
                  controller: referralWalletController,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class WalletWidget extends StatefulWidget {
  final bool isReferralWallet;
  final TextEditingController controller;
  final bool isRedirectedAutomatically;
  const WalletWidget({
    Key? key,
    this.isReferralWallet = false,
    this.isRedirectedAutomatically = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  late PayCubit payCubit;
  late RadioButtonCubit radioButtonCubit;
  @override
  void initState() {
    super.initState();
    payCubit = BlocProvider.of<PayCubit>(context);
    radioButtonCubit = BlocProvider.of<RadioButtonCubit>(context);
    payCubit.initPay();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    payCubit.capturePayment(
        double.parse(widget.controller.text), response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.message);

    showSnackBar(context, "Failed to Add Money");

    // Do something when payment fails
  }

  @override
  void dispose() {
    payCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayCubit, PayState>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          _handlePaymentSuccess(state.paymentSuccessResponse);
          if (widget.isRedirectedAutomatically) {
            Navigator.pop(context, true);
          }
          // print(state.paymentSuccessResponse.paymentId);
        } else if (state is PaymentErrorState) {
          _handlePaymentError(state.paymentFailureResponse);
        } else if (state is GetOrderIdSuccessState) {
          if (widget.controller.text == "") {
            widget.controller.text = "0.00";
          }
          payCubit.openCheckOut(
              double.parse(widget.controller.text), state.orderId);
        } else if (state is CapturePaymentSuccessState) {
          showSnackBar(context, "Successfully Added Money");
        } else if (state is CapturePaymentFailureState ||
            state is GetOrderIdFailureState) {
          showSnackBar(context, "Failed to Add Money");
        } else if (state is CapturePaymentSuccessState) {
          SessionConstants.walletAmount += double.parse(widget.controller.text);
        }
      },
      builder: (context, state) {
        if (state is GetOrderIdInProgressState ||
            state is CapturePaymentInProgressState) {
          return Center(child: CircularProgressIndicator());
        }
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
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "\u{20B9}${SessionConstants.walletAmount}",
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
                height: 225,
                width: 382,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black12)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: widget.controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
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
                    SizedBox(height: 15),
                    widget.isReferralWallet
                        ? BlocBuilder<RadioButtonCubit, RadioButtonState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "To Bank",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Radio<WalletTransferOptions>(
                                      value: WalletTransferOptions.toBank,
                                      groupValue: state.walletTransferOptionVal,
                                      onChanged: (val) {
                                        radioButtonCubit
                                            .walletTransferOptionSelected(val);
                                      }),
                                  SizedBox(width: 20),
                                  Text(
                                    "To Wallet",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Radio<WalletTransferOptions>(
                                      value: WalletTransferOptions.toWallet,
                                      groupValue: state.walletTransferOptionVal,
                                      onChanged: (val) {
                                        radioButtonCubit
                                            .walletTransferOptionSelected(val);
                                      }),
                                ],
                              );
                            },
                          )
                        : Container(),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        if (widget.controller.text == "") {
                          widget.controller.text == "0.00";
                        }
                        payCubit
                            .getOrderId(double.parse(widget.controller.text));
                      },
                      child: Text(widget.isReferralWallet
                          ? "Transfer Money"
                          : "Add Money"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(353, 49)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.isReferralWallet
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              EarningReportPage.route,
                            );
                          },
                          child: CardWidgetWallet(
                            text: "Earning\nReport",
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RechargeHistoryPage.route,
                            );
                          },
                          child: CardWidgetWallet(
                            text: "Recharge\nHistory",
                          ),
                        ),
                  widget.isReferralWallet
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              WithdrawReportPage.route,
                            );
                          },
                          child: CardWidgetWallet(
                            isRightSideWidget: true,
                            text: "WithDraw\nReport",
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              BillingHistoryPage.route,
                            );
                          },
                          child: CardWidgetWallet(
                            isRightSideWidget: true,
                            text: "Billing\nHistory",
                          ),
                        ),
                ],
              )
            ],
          ),
        );
      },
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
