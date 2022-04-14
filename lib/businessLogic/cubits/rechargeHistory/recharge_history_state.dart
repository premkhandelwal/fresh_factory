part of 'recharge_history_cubit.dart';

abstract class RechargeHistoryState extends Equatable {
  const RechargeHistoryState();

  @override
  List<Object> get props => [DateTime.now()];
}

class RechargeHistoryInitial extends RechargeHistoryState {}

class ListSeparatedState extends RechargeHistoryState {
  final Map<String, List<RechargeHistoryItem>> recharges;
  ListSeparatedState({
    required this.recharges,
  });
   @override
  List<Object> get props => [DateTime.now()];
}
