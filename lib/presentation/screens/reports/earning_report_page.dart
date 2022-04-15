import 'package:flutter/material.dart';
import 'package:fresh/data/models/earning_report_item.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class EarningReportPage extends StatefulWidget {
  static final route = "/earningReportPage";
  const EarningReportPage({Key? key}) : super(key: key);

  @override
  _EarningReportPageState createState() => _EarningReportPageState();
}

List<EarningReportItem> _earnigsList = [
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
  EarningReportItem(
    date: "05/10/2021",
    referralName: "John",
    referralAmount: 400,
    creditAmount: 80,
    withdrawAmount: 140,
  ),
];

class _EarningReportPageState extends State<EarningReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Earning Report"),
      body: InteractiveViewer(
        constrained: false,
        child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) {
                return Color(0xff02096B);
              },
            ),
            headingTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            columns: [
              DataColumn(
                label: Text("Date"),
              ),
              DataColumn(
                label: Text("Referral Name"),
              ),
              DataColumn(
                label: Text("Referral Amount"),
              ),
              DataColumn(
                label: Text("Credit Amount"),
              ),
              DataColumn(
                label: Text("Withdraw Amount"),
              ),
            ],
            rows: [
              for (var i = 0; i < _earnigsList.length; i++) ...[
                DataRow(
                  cells: [
                    DataCell(Text(_earnigsList[i].date)),
                    DataCell(Text(_earnigsList[i].referralName)),
                    DataCell(Text(_earnigsList[i].referralAmount.toString())),
                    DataCell(Text(_earnigsList[i].creditAmount.toString())),
                    DataCell(Text(_earnigsList[i].withdrawAmount.toString())),
                  ],
                ),
              ],
            ]),
      ),
    );
  }
}
