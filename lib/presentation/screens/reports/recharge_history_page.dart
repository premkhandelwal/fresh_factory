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
      header: "Febrauray 2022",
      srNo: 1,
      date: "12/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "January 2022",
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
      date: "11/01/2022",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
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
      header: "December 2021",
      srNo: 3,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "December 2021",
      srNo: 3,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
    RechargeHistoryItem(
      header: "December 2021",
      srNo: 3,
      date: "12/12/2021",
      actualRechargeAmount: 500.00,
      platformBonusAmount: 10.00,
      totalAmount: 550.00,
      paymentMethod: "PayTM",
    ),
  ];
  late RechargeHistoryCubit rechargeHistoryCubit;
  @override
  void initState() {
    rechargeHistoryCubit = BlocProvider.of<RechargeHistoryCubit>(context);
    rechargeHistoryCubit.separateList(rechargeHistoryItem);
    super.initState();
  }

  Map<String, List<RechargeHistoryItem>> _recharges = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Recharge History"),
      body: BlocConsumer<RechargeHistoryCubit, RechargeHistoryState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (_recharges.isNotEmpty) {
            return Column(
              children: [
                for (var i = 0; i < _recharges.length; i++) ...[
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff02096B),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_recharges.keys.toList()[i],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: _recharges[i]!.length,
                        itemBuilder: (ctx, ind) {
                          return ListTile(
                            title: Text(_recharges[i]![ind].srNo.toString()),
                          );
                        }),
                  )
                ],
              ],
            );
          }
          return Center(child: Text("Nothing to show here"));
        },
      ),
    );
  }
}
