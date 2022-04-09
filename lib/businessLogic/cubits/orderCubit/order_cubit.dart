import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void statusOrderWidgetClicked(int changeTo) {
    emit(OrderWidgetClickedState(index: changeTo));
  }
}
