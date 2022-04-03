part of 'pay_cubit.dart';

abstract class PayState extends Equatable {
  const PayState();

  @override
  List<Object> get props => [];
}

class PayInitial extends PayState {}

class GetOrderIdInProgressState extends PayState{}
class GetOrderIdSuccessState extends PayState {
  final String orderId;
  GetOrderIdSuccessState({
    required this.orderId,
  });
}
class GetOrderIdFailureState extends PayState{}

class CapturePaymentSuccessState extends PayState{}
class CapturePaymentInProgressState extends PayState{}

class CapturePaymentFailureState extends PayState{}

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
