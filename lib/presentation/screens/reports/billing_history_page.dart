import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class BillingHistoryPage extends StatefulWidget {
  static final route = "/billingHistoryPage";
  const BillingHistoryPage({Key? key}) : super(key: key);

  @override
  _BillingHistoryPageState createState() => _BillingHistoryPageState();
}

class _BillingHistoryPageState extends State<BillingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Billing History"),
      body: Container(),
    );
  }
}
