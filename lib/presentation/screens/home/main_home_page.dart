import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/tab_navigator.dart';

class MainHomePage extends StatefulWidget {
  static String route = '/mainHomeScreen';

  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}


/* List<Widget> _pages = [
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
]; */


class _MainHomePageState extends State<MainHomePage> {
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4", "Page5"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
    "Page5": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectPage(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  Widget _buildOffStageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem]!, tabItem: tabItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRoute =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRoute) {
          if (_currentPage != "Page1") {
            _selectPage("Page1", 1);
            return false;
          }
        }
        return isFirstRoute;
      },
      child: Scaffold(
          // drawer: DrawerWidget(),
          // bottomNavigationBar: BottomNavBarWidget(currentIndex: state.index),

          extendBodyBehindAppBar: true,
          // bottomSheet: BottomNavBarWidget(),
          bottomNavigationBar: BottomNavigationBar(
             unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Colors.red,
            showUnselectedLabels: true,
              onTap: (index) {
                _selectPage(pageKeys[index], index);
              },
              currentIndex: _selectedIndex,
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
          body: Stack(
            children: [
              _buildOffStageNavigator("Page1"),
              _buildOffStageNavigator("Page2"),
              _buildOffStageNavigator("Page3"),
              _buildOffStageNavigator("Page4"),
              _buildOffStageNavigator("Page5"),
            ],
          )
          /* [
            PersistentTabView(
          context,
          controller: _persistentTabController,
          navBarStyle: NavBarStyle.simple,
          onWillPop: (po) {
            return Future.value(false);
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
          ] */
          /* BottomNavigationBar(
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
      ) */
          ),
    );
  }
}
