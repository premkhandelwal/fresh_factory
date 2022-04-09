part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [DateTime.now()];
}

class OrderInitial extends OrderState {}

class OrderWidgetClickedState extends OrderState {
  final int  index;
  OrderWidgetClickedState({
    required this.index,
  });
}
