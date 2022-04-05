import 'package:flutter/material.dart';
import 'package:fresh/presentation/screens/home/cart_page.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

PersistentTabController _persistentTabController = PersistentTabController();

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

List<Widget> _pages = [
  SafeArea(child: HomePage()),
  Center(child: Container(child: Text("This is Categories Page"))),
  WalletScreen(),
  CartPage(),
  Center(child: Container(child: Text("This is Support Page"))),
];

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
        navBarStyle: NavBarStyle.simple,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            inactiveColorPrimary: Colors.grey,
            // unselectedLabelStyle: TextStyle(color: Colors.black),
            activeColorPrimary: Colors.red,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.category),
            title: "Categories",
            inactiveColorPrimary: Colors.grey,
            // unselectedLabelStyle: TextStyle(color: Colors.black),
            activeColorPrimary: Colors.red,

            // backgroundColor: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.badge),
            title: "Wallet",
            inactiveColorPrimary: Colors.grey,
            // unselectedLabelStyle: TextStyle(color: Colors.black),
            activeColorPrimary: Colors.red,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            title: "Cart",
            inactiveColorPrimary: Colors.grey,
            // unselectedLabelStyle: TextStyle(color: Colors.black),
            activeColorPrimary: Colors.red,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.support_agent),
            title: "Support",
            inactiveColorPrimary: Colors.grey,
            // unselectedLabelStyle: TextStyle(color: Colors.black),
            activeColorPrimary: Colors.red,
            // backgroundColor: Colors.grey,
          ),
        ],
        screens: _pages,
        confineInSafeArea: true,
      ),
    );
  }
}
