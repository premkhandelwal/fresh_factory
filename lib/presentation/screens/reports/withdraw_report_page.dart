import 'package:flutter/material.dart';
import 'package:fresh/data/models/withdraw_report_item.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class WithdrawReportPage extends StatefulWidget {
  static final route = "/withdrawReportPage";
  const WithdrawReportPage({Key? key}) : super(key: key);

  @override
  _WithdrawReportPageState createState() => _WithdrawReportPageState();
}

List<WithdrawReportItem> _withdrawList = [
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
  WithdrawReportItem(
    date: "05/10/2021",
    openingBalance: 500,
    withdrawAmount: 400,
    tds: 25,
    adminCharges: 25,
    netAmountPaid: 350,
    finalBalance: 150,
  ),
];

class _WithdrawReportPageState extends State<WithdrawReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Withdraw Report"),
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
                label: Text("Opening Balance"),
              ),
              DataColumn(
                label: Text("Withdraw Amount"),
              ),
              DataColumn(
                label: Text("TDS"),
              ),
              DataColumn(
                label: Text("Admin Charges"),
              ),
              DataColumn(
                label: Text("Net Amount Paid"),
              ),
              DataColumn(
                label: Text("Final Balance"),
              ),
            ],
            rows: [
              for (var i = 0; i < _withdrawList.length; i++) ...[
                DataRow(
                  cells: [
                    DataCell(Text(_withdrawList[i].date)),
                    DataCell(Text(_withdrawList[i].openingBalance.toString())),
                    DataCell(Text(_withdrawList[i].withdrawAmount.toString())),
                    DataCell(Text(_withdrawList[i].tds.toString())),
                    DataCell(Text(_withdrawList[i].adminCharges.toString())),
                    DataCell(Text(_withdrawList[i].netAmountPaid.toString())),
                    DataCell(Text(_withdrawList[i].finalBalance.toString())),
                  ],
                ),
              ],
            ]),
      ),
    );
  }
}
