import 'package:flutter/material.dart';
import 'package:fresh/businessLogic/cubits/orderCubit/order_cubit.dart';
import 'package:fresh/presentation/screens/home/cart_page.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/orders/all_orders_widget.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

PersistentTabController _persistentTabController = PersistentTabController();

class MainHomePage extends StatefulWidget {
  static String route = '/mainHomeScreen';

  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

final _page1 = GlobalKey<NavigatorState>();
final _page2 = GlobalKey<NavigatorState>();
final _page3 = GlobalKey<NavigatorState>();
final _page4 = GlobalKey<NavigatorState>();
final _page5 = GlobalKey<NavigatorState>();

List<Widget> _pages = [
  Navigator(
    key: _page1,
    onGenerateRoute: (route) => MaterialPageRoute(
        settings: route, builder: (context) => SafeArea(child: HomePage())),
  ),
  Navigator(
    key: _page2,

    onGenerateRoute: (route) => MaterialPageRoute(
      settings: route,
      builder: (context) =>
          Center(child: Container(child: Text("This is Categories Page"))),
    ),
  ),
  Navigator(
    key: _page3,

    initialRoute: WalletScreen.route,

    onGenerateRoute: (route) => MaterialPageRoute(
      settings: route,
      builder: (context) => WalletScreen(),

    ),
  ),
  Navigator(
    key: _page4,

    onGenerateRoute: (route) => MaterialPageRoute(
      settings: route,
      builder: (context) => CartPage(),
    ),
  ),
  Navigator(
    key: _page5,
    onGenerateRoute: (route) => MaterialPageRoute(
      settings: route,
      builder: (context) =>
          Center(child: Container(child: Text("This is Support Page"))),
    ),
  ),
];

class _MainHomePageState extends State<MainHomePage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
            index: _bottomNavIndex,
            children: _pages
          ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.red,

          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Colors.red,
          showUnselectedLabels: true,
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
            ;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",

              // backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: "Support",
              // backgroundColor: Colors.grey,
            ),
          ]),
    );
  }
}
