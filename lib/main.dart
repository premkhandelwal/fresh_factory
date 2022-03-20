import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/main%20copy1.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:fresh/presentation/screens/payments/bank_details.dart';
import 'package:fresh/presentation/screens/payments/payment_method_screen.dart';
import 'package:fresh/presentation/widgets/home/fortune_wheel_widget.dart';

void main() {
  runApp( MyApp(authProvider: AuthProvider(),));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  const MyApp({
    Key? key,
    required this.authProvider,
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
           )
          ],
          child:  MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  colorScheme: const ColorScheme.light(primary: Color(0xff02096B)),
                  textTheme:
                      const TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
                          .apply(bodyColor: const Color(0xff02096B))),
              //0xFF0D47A1
              home: const NewWidget(),
            ),
        );
      }
    );
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const HomePage()),
              );
            },
            child: const Text("Home Page"),
            style: ElevatedButton.styleFrom(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => const WalletScreen()),
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
        ],
      ),
    ));
  }
}
