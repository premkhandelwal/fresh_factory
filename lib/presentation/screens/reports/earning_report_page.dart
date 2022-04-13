import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class EarningReportPage extends StatefulWidget {
  static final route = "/earningReportPage";
  const EarningReportPage({Key? key}) : super(key: key);

  @override
  _EarningReportPageState createState() => _EarningReportPageState();
}

class _EarningReportPageState extends State<EarningReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Earning Report"),
    );
  }
}
