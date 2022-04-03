part of 'pay_cubit.dart';

abstract class PayState extends Equatable {
  const PayState();

  @override
  List<Object> get props => [];
}

class PayInitial extends PayState {}

class GetOrderIdState extends PayState {
  final String orderId;
  GetOrderIdState({
    required this.orderId,
  });
}

class PaymentSuccessState extends PayState {
  final PaymentSuccessResponse paymentSuccessResponse;
  PaymentSuccessState({
    required this.paymentSuccessResponse,
  });
}

class PaymentErrorState extends PayState {
  final PaymentFailureResponse paymentFailureResponse;
  PaymentErrorState({
    required this.paymentFailureResponse,
  });
}
