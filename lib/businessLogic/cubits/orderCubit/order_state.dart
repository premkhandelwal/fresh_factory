part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderWidgetClickedState extends OrderState {
  final Widget changeTo;
  OrderWidgetClickedState({
    required this.changeTo,
  });
}
