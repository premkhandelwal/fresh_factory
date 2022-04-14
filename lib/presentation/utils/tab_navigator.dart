import 'package:flutter/material.dart';
import 'package:fresh/config/routes.dart';
import 'package:fresh/presentation/screens/home/cart_page.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/miscellaneous/category_page.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = Container();
    if (tabItem == "Page1") {
      child1 = HomePage();
    } else if (tabItem == "Page2") {
      child1 = CategoryPage();
    } else if (tabItem == "Page3") {
      child1 = WalletScreen();
    } else if (tabItem == "Page4") {
      child1 = CartPage();
    } else if (tabItem == "Page5") {
      child1 = Center(child: Container(child: Text("This is Support Page")));
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        if (settings.name != "/") {
        print(settings.name);
          var widget = namedRoutes.keys.toList().indexWhere((k) {
            return k == settings.name;
          });
          if (widget != -1) {
            print(namedRoutes.values.toList()[widget]);
            return MaterialPageRoute(
                builder: namedRoutes.values.toList()[widget],
                settings: settings);
          }
        }
        return MaterialPageRoute(
          builder: (context) => child1,
        );
      },
    );
  }
}
