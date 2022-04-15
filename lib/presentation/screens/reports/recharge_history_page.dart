import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/rechargeHistory/recharge_history_cubit.dart';
import 'package:fresh/data/models/recharge_history_item.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class RechargeHistoryPage extends StatefulWidget {
  static final route = "/rechargeHistoryPage";
  const RechargeHistoryPage({Key? key}) : super(key: key);

  @override
  _RechargeHistoryPageState createState() => _RechargeHistoryPageState();
}

class _RechargeHistoryPageState extends State<RechargeHistoryPage> {
  List<RechargeHistoryItem> rechargeHistoryItem = [
    RechargeHistoryItem(
      header: "February 2022",
      srNo: 1,
      date: "12/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "January 2022",
      srNo: 2,
      date: "12/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "GPAY",
    ),
    RechargeHistoryItem(
      header: "January 2022",
      srNo: 3,
      date: "11/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "January 2022",
      srNo: 4,
      date: "11/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "December 2021",
      srNo: 5,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "December 2021",
      srNo: 6,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "December 2021",
      srNo: 7,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "Airtel Bank",
    ),
  ];
  @override
  void initState() {
    separateList();
    super.initState();
  }

  Map<String, List<RechargeHistoryItem>> _recharges = {};

  void separateList() {
    String currentItem = rechargeHistoryItem.first.header;
    for (var item in rechargeHistoryItem) {
      if (item.header != currentItem) {
        currentItem = item.header;
      }
      if (_recharges[currentItem] != null) {
        _recharges[currentItem]!.add(item);
      } else {
        _recharges[currentItem] = [item];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _keys = _recharges.keys.toList();
    List<List<RechargeHistoryItem>> _values = _recharges.values.toList();
    return Scaffold(
      appBar: CustomAppBar(title: "Recharge History"),
      body: _recharges.isNotEmpty
          ? SingleChildScrollView(
              child: (Column(children: [
                for (var i = 0; i < _recharges.length; i++) ...[
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff02096B),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _keys[i],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DataTable(
                      dataRowHeight: 100,
                      columnSpacing: 20,
                      headingRowHeight: 0,
                      border: TableBorder.symmetric(),
                      columns: [
                        DataColumn(
                          label: Text(""),
                        ),
                        DataColumn(
                          label: Text(""),
                        ),
                        DataColumn(
                          label: Text(""),
                        ),
                        DataColumn(
                          label: Text(""),
                        ),
                      ],
                      rows: [
                        for (var ind = 0; ind < _values[i].length; ind++) ...[
                          DataRow(
                            cells: [
                              DataCell(Text(_values[i][ind].srNo.toString())),
                              DataCell(Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_values[i][ind].date.toString()),
                                  SizedBox(height: 10),
                                  Text("Payment Method")
                                ],
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Flexible(child: Text("Actual Recharge", overflow: TextOverflow.fade,)),
                                    Text("Platform Bonus"),
                                    Text("Total Amount"),
                                  ],
                                ),
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Flexible(
                                        child: Text(
                                            "\u{20B9} ${_values[i][ind].actualRechargeAmount.toString()}")),
                                    Text(
                                        "+${_values[i][ind].platformBonusAmount.toString()}%"),
                                    Text(
                                        "\u{20B9} ${_values[i][ind].totalAmount.toString()}"),
                                        SizedBox(height: 15),
                                    Text("${_values[i][ind].paymentMethod}"),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ],
                      ]),
                ],
              ])),
            )
          : Center(
              child: Text("Nothing to show here"),
            ),
    );
  }
}
