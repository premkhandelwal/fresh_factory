import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  late Razorpay _razorpay;

  PayCubit() : super(PayInitial());

  void initPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse res) {
      emit(PaymentSuccessState(paymentSuccessResponse: res));
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse res) {
      emit(PaymentErrorState(paymentFailureResponse: res));
    });
  }

  void openCheckOut(double amount, String orderId) {
    var options = {
      'key': Secrets.razorPayKey,
      'amount': (amount * 100).toInt(),
      'name': 'Fresh From Factory',
      'order_id': orderId,
      'description': 'Checkout',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {}
  }

  void getOrderId(double amount) async {
    String url = Secrets.host + "/api/generate_order_number";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"amount": amount * 100}));

    if (res.statusCode == 200) {
      emit(GetOrderIdState(orderId: json.decode(res.body)['ordid']));
    }
  }


  void dispose() {
    _razorpay.clear();
  }
}
