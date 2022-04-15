import 'package:flutter/material.dart';
import 'package:fresh/data/models/billing_history_item.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class BillingHistoryPage extends StatefulWidget {
  static final route = "/billingHistoryPage";
  const BillingHistoryPage({Key? key}) : super(key: key);

  @override
  _BillingHistoryPageState createState() => _BillingHistoryPageState();
}

class _BillingHistoryPageState extends State<BillingHistoryPage> {
  List<BillingHistoryItem> billingHistoryItem = [
    BillingHistoryItem(
      header: "February 2022",
      srNo: 1,
      name: "Adobe",
      date: "12/02/2022",
      amount: 5500.00,
    ),
    BillingHistoryItem(
      header: "February 2022",
      srNo: 2,
      name: "Dribble",
      date: "11/02/2022",
      amount: 550.00,
    ),
    BillingHistoryItem(
      header: "February 2022",
      srNo: 3,
      name: "Amazon",
      date: "11/02/2022",
      amount: 55.00,
    ),
    BillingHistoryItem(
      header: "January 2022",
      srNo: 4,
      name: "Google",
      date: "11/01/2022",
      amount: 550000.00,
    ),
    BillingHistoryItem(
      header: "January 2022",
      srNo: 5,
      name: "Microsoft",
      date: "01/01/2022",
      amount: 150000.00,
    ),
    BillingHistoryItem(
      header: "January 2021",
      srNo: 6,
      name: "Accenture",
      date: "31/12/2021",
      amount: 15000.00,
    ),
  ];

  @override
  void initState() {
    separateList();
    super.initState();
  }

  Map<String, List<BillingHistoryItem>> _billings = {};

  void separateList() {
    String currentItem = billingHistoryItem.first.header;
    for (var item in billingHistoryItem) {
      if (item.header != currentItem) {
        currentItem = item.header;
      }
      if (_billings[currentItem] != null) {
        _billings[currentItem]!.add(item);
      } else {
        _billings[currentItem] = [item];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _keys = _billings.keys.toList();
    List<List<BillingHistoryItem>> _values = _billings.values.toList();
    return Scaffold(
      appBar: CustomAppBar(title: "Billing History"),
      body: _billings.isNotEmpty
          ? SingleChildScrollView(
              child: (Column(children: [
                for (var i = 0; i < _billings.length; i++) ...[
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
                                  Text(_values[i][ind].name),
                                  Text(_values[i][ind].date.toString()),
                                ],
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        "\u{20B9} ${_values[i][ind].amount.toString()}"),
                                    SizedBox(height: 15),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons
                                              .account_balance_wallet_sharp),
                                          Text("Invoice")
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        )
                                      ),
                                    ),
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
