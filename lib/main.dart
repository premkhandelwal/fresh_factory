import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/businessLogic/blocs/profile/profile_bloc.dart';
import 'package:fresh/businessLogic/cubits/bottomNavigationBar/bottomnavigationbar_cubit.dart';
import 'package:fresh/businessLogic/cubits/payCubit/pay_cubit.dart';
import 'package:fresh/businessLogic/cubits/radioButtonCubit/radio_button_cubit.dart';
import 'package:fresh/businessLogic/cubits/sortFilterProduct/sort_filter_product_cubit.dart';
import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/data/dataProviders/product_provider.dart';
import 'package:fresh/data/dataProviders/profile_provider.dart';
import 'package:fresh/presentation/screens/auth/forgot_password_screen.dart';
import 'package:fresh/presentation/screens/auth/login_sign_up.dart';
import 'package:fresh/presentation/screens/auth/setPassword.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/home/main_home_page.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:fresh/presentation/screens/payments/bank_details_screen.dart';
import 'package:fresh/presentation/screens/payments/payment_method_screen.dart';
import 'package:fresh/presentation/screens/products/product_detail_page1.dart';
import 'package:fresh/presentation/screens/products/product_detail_page4.dart';
import 'package:fresh/presentation/widgets/home/fortune_wheel_widget.dart';

void main() {
  runApp(MyApp(
    authProvider: AuthProvider(),
    productProvider: ProductProvider(),
    profileProvider: ProfileProvider(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final ProductProvider productProvider;
  final ProfileProvider profileProvider;
  const MyApp({
    Key? key,
    required this.authProvider,
    required this.productProvider,
    required this.profileProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 851), //Redmi Note 7
        builder: () {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthBloc(authProvider: authProvider),
              ),
              BlocProvider(
                create: (context) =>
                    ProductBloc(productProvider: productProvider),
              ),
              BlocProvider(
                create: (context) => BottomnavigationbarCubit(),
              ),
              BlocProvider(
                create: (context) => SortFilterProductCubit(),
              ),
              BlocProvider(
                create: (context) => RadioButtonCubit(),
              ),
              BlocProvider(
                create: (context) => ProfileBloc(profileProvider: profileProvider),
              ),
              BlocProvider(
                create: (context) => PayCubit(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  colorScheme:
                      const ColorScheme.light(primary: Color(0xff02096B)),
                  textTheme: const TextTheme(
                          bodyText1: TextStyle(), bodyText2: TextStyle())
                      .apply(bodyColor: const Color(0xff02096B))),
              //0xFF0D47A1
              home: const MainHomePage(),
            ),
          );
        });
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.green,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const MainPage()),
              );
            },
            child: const Text("Login / SignUp"),
            style: ElevatedButton.styleFrom(),
          ),
          /* ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const MainHomePage()),
              );
            },
            child: const Text("Home Page"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const WalletScreen()),
              );
            },
            child: const Text("Referral Wallet Page"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => const PaymentMethodScreen()),
              );
            },
            child: const Text("Payment Method Screen"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const BankDetailsScreen()),
              );
            },
            child: const Text("Bank Details Screen"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const FortuneWheelWidget()),
              );
            },
            child: const Text("Fortune Wheel"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const ForgotPass()),
              );
            },
            child: const Text("Forgot Password"),
            style: ElevatedButton.styleFrom(),
          ), */
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const SetPassword()),
              );
            },
            child: const Text("Set Password"),
            style: ElevatedButton.styleFrom(),
          ),
        ],
      ),
    ));
  }
}
