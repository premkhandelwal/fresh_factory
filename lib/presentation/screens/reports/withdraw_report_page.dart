import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class WithdrawReportPage extends StatefulWidget {
  static final route = "/withdrawReportPage";
  const WithdrawReportPage({Key? key}) : super(key: key);

  @override
  _WithdrawReportPageState createState() => _WithdrawReportPageState();
}

class _WithdrawReportPageState extends State<WithdrawReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Withdraw Report"),
    );
  }
}
