import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/bottomNavBarCubit/bottom_nav_bar_cubit.dart';
import 'package:fresh/presentation/screens/home/cart_page.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarCubit bottomNavBarCubit =
        BlocProvider.of<BottomNavBarCubit>(context);
    return BottomNavigationBar(
        // backgroundColor: Colors.red,

        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        currentIndex: bottomNavBarCubit.state.currIndex,
        onTap: (index) {
          bottomNavBarCubit.changeIndex(index);
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
        ]);
  }
}



/* class PersistentBottomBarWidget extends StatelessWidget {
  
  const PersistentBottomBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
  HomePage(),
  Center(child: Container(child: Text("This is Categories Page"))),
  WalletScreen(),
  CartPage(),
  Center(child: Container(child: Text("This is Support Page"))),
];
          final BottomNavBarCubit bottomNavBarCubit =
        BlocProvider.of<BottomNavBarCubit>(context);
    return PersistentTabView(
        context,
        // handleAndroidBackButtonPress: false,
        navBarStyle: NavBarStyle.simple,
        onItemSelected: (index){
          bottomNavBarCubit.changeIndex(index);
        },
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
          )
         ;}}
 */            /* BottomNavigationBar(
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
      },
    );
  }
}
  */