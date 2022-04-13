part of 'recharge_history_cubit.dart';

abstract class RechargeHistoryState extends Equatable {
  const RechargeHistoryState();

  @override
  List<Object> get props => [];
}

class RechargeHistoryInitial extends RechargeHistoryState {}

class DifferentHeaderEncountered extends RechargeHistoryState{}

class SameHeaderEncountered extends RechargeHistoryState{}