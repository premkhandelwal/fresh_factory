import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh/data/models/recharge_history_item.dart';

part 'recharge_history_state.dart';

class RechargeHistoryCubit extends Cubit<RechargeHistoryState> {
  RechargeHistoryCubit() : super(RechargeHistoryInitial());

  void separateList(List<RechargeHistoryItem> rechargeHostoryList) {
    final List<String> cityNames =
        rechargeHostoryList.map((city) => city.header).toSet().toList();
    String currentItem = rechargeHostoryList.first.header;
    Map<String, List<RechargeHistoryItem>> x = {};

    for (var item in rechargeHostoryList) {
      if (item.header != currentItem) {
        currentItem = item.header;
      }
      if (x[currentItem] != null) {
        List<RechargeHistoryItem> vals = x[currentItem]!;
        vals.add(item);
        x[currentItem] = vals;
      } else {
        x[currentItem] = [item];
      }
    }
    print(x);
  }
}
