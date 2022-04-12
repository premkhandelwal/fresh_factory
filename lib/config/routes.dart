import 'package:flutter/material.dart';
import 'package:fresh/presentation/screens/auth/changePassword.dart';
import 'package:fresh/presentation/screens/auth/forgot_password_screen.dart';
import 'package:fresh/presentation/screens/auth/login.dart';
import 'package:fresh/presentation/screens/auth/login_sign_up.dart';
import 'package:fresh/presentation/screens/auth/setPassword.dart';
import 'package:fresh/presentation/screens/auth/signup.dart';
import 'package:fresh/presentation/screens/auth/veriify.dart';
import 'package:fresh/presentation/screens/home/cart_page.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/home/main_home_page.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/screens/orders/no_order_present_widget.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';
import 'package:fresh/presentation/screens/payments/bank_details_screen.dart';
import 'package:fresh/presentation/screens/payments/payment_method_screen.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/product_detail_page1.dart';
import 'package:fresh/presentation/screens/products/product_detail_page2.dart';
import 'package:fresh/presentation/screens/products/product_detail_page3.dart';
import 'package:fresh/presentation/screens/products/product_detail_page4.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/screens/products/sort_filter_product_page.dart';
import 'package:fresh/presentation/screens/products/temp_product_page.dart';
import 'package:fresh/presentation/screens/profile/edit_profile_details_page.dart';

Map<String, Widget Function(BuildContext context)> namedRoutes = {
  ChangePassword.route: (ctx) {
    return const ChangePassword();
  },
  ForgotPass.route: (ctx) =>  ForgotPass(),
  SetPassword.route: (ctx) => const SetPassword(),
  MainPage.route: (ctx) => const MainPage(),
  LoginScreen.route: (ctx) => const LoginScreen(),
  SignupScreen.route: (ctx) => const SignupScreen(),
  VerifyOtp.route: (ctx) => const VerifyOtp(),
  CartPage.route: (ctx) => const CartPage(),
  HomePage.route: (ctx) =>  HomePage(),
  MainHomePage.route: (ctx) => const MainHomePage(),
  OfferPage.route: (ctx) => const OfferPage(),
  NoOrderPresentWidget.route: (ctx) => const NoOrderPresentWidget(),
  OrderMainPage.route: (ctx) => const OrderMainPage(),
  BankDetailsScreen.route: (ctx) => const BankDetailsScreen(),
  PaymentMethodScreen.route: (ctx) => const PaymentMethodScreen(),
  WalletScreen.route: (ctx) => const WalletScreen(),
  ProductDetailPage.route: (ctx) => const ProductDetailPage(),
  ProductDetailPage1.route: (ctx) => const ProductDetailPage1(),
  ProductDetailPage2.route: (ctx) => const ProductDetailPage2(),
  ProductDetailPage3.route: (ctx) => const ProductDetailPage3(),
  ProductDetailPage4.route: (ctx) =>
      ProductDetailPage4(),
  ProductsPage.route: (ctx) => ProductsPage(),
  SortFilterProductPage.route: (ctx) => const SortFilterProductPage(),
  EditProfileDetailsPage.route: (ctx) => const EditProfileDetailsPage(),
  TempPageForProduct.route: (ctx) => const TempPageForProduct()
};
