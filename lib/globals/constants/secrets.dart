import 'package:fresh/config/paths.dart';

class Secrets {
  static const host = "https://freshfromfactory.pythonanywhere.com";
  static const mediaUrl = "https://freshfromfactory.pythonanywhere.com/media/";
  static const companyId = "93861ffb-c13f-492b-a29e-cf080bafe666";
  static final razorPayKey = Paths.isLive ? "//TODO Add live razorpay key here"
  : "rzp_test_9RkytA0P2A0KV6";
  static final razorPaySecret = Paths.isLive ? "//TODO Add live razorpay secret here"
  : "5YFyk4D16AKz9ZFFuLNaN4ZJ";
}
