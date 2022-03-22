import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresh/businessLogic/cubits/bottomNavigationBar/bottomnavigationbar_cubit.dart';
import 'package:fresh/presentation/screens/home/app_bar_widgets_home.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';
import 'package:fresh/presentation/screens/payments/bank_details.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:fresh/presentation/screens/profile/edit_profile_details_page.dart';

int currentIndex = 0;

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<Widget> _pages = [
    HomePage(),
    Container(),
    WalletScreen(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationbarCubit, PageState>(
      builder: (context, state) {
        return Scaffold(
            drawer: state.index == 0 ?  DrawerWidget() : null,
            bottomNavigationBar: BottomNavBarWidget(currentIndex: state.index),
            appBar: state.index == 0 ?AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              // automaticallyImplyLeading: false,
              title: const AppBarWidgets(),
            ): null,
            body: _pages[state.index]);
      },
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instaLogo = AssetImage('assets/instagram.png');

    return Drawer(
        child: ListView(
      children: [
        SizedBox(
          height: 177.h,
          width: 318.w,
          child: DrawerHeader(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    height: 76.h,
                    width: 76.w,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Anna Deo',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Annadeo@gmail.com",
                    style: TextStyle(color: Colors.pink),
                  )
                ],
              ),
            ),
          ),
        ),
        ExpansionTile(
          leading: Icon(
            Icons.account_box,
            color: Colors.pink,
          ),
          // tilePadding: EdgeInsets.zero,
          // childrenPadding: ,

          title: Transform.translate(
              offset: Offset(-16, 0),
              child: Text(
                "My Account",
                style: TextStyle(color: const Color(0xff02096B)),
              )),
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          expandedAlignment: Alignment.centerRight,
          children: [
            ListTile(
              title: Text("Basic Info"),
              dense: true,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 64),
              visualDensity: VisualDensity(horizontal: 1, vertical: -4),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => EditProfileDetailsPage()),
                );
              },
            ),
            ListTile(
              title: Text("Bank Info"),
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 64),
              visualDensity: VisualDensity(horizontal: 1, vertical: -4),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => BankDetailsScreen()),
                );
              },
            ),
            SizedBox(height: 15),
          ],
        ),
        /*  ListTile(
         leading: Icon(Icons.account_circle_outlined, color: Colors.pink),
         title: Text("My Profile"),
         minLeadingWidth: 8,
       ), */
        ListTile(
          leading: Icon(Icons.add_card, color: Colors.pink),
          title: Text("My Wallet"),
          minLeadingWidth: 8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => WalletScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment, color: Colors.pink),
          title: Text("My Orders"),
          minLeadingWidth: 8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => OrderMainPage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.local_offer_outlined, color: Colors.pink),
          title: Text("My Offers"),
          minLeadingWidth: 8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => OfferPage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.attach_money, color: Colors.pink),
          title: Text("Refer & Earn"),
          minLeadingWidth: 8,
        ),
        ListTile(
          leading: Icon(Icons.content_paste_go_rounded, color: Colors.pink),
          title: Text("Legal"),
          minLeadingWidth: 8,
        ),
        ListTile(
          leading: Icon(Icons.support_agent, color: Colors.pink),
          title: Text("Support"),
          minLeadingWidth: 8,
        ),
        ListTile(
          leading: Icon(Icons.rate_review_outlined, color: Colors.pink),
          title: Text("Rate this app"),
          minLeadingWidth: 8,
        ),
        ListTile(
          leading: Icon(Icons.thumb_up_alt_outlined, color: Colors.pink),
          title: Text("Follow Us"),
          minLeadingWidth: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook_outlined,
              color: Colors.pink,
              size: 35,
            ),
            SizedBox(width: 10),
            Image(image: instaLogo)
          ],
        ),
        SizedBox(height: 15),
        Divider(
          color: Colors.black54,
          height: 2,
        ),
        ListTile(
          leading: Icon(Icons.logout_outlined, color: Colors.pink),
          title: Text("Log Out"),
          minLeadingWidth: 8,
        ),
      ],
    ));
  }
}

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavBarWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit =
        BlocProvider.of<BottomnavigationbarCubit>(context);
    return BlocBuilder<BottomnavigationbarCubit, PageState>(
      builder: (context, state) {
        return BottomNavigationBar(
            // backgroundColor: Colors.red,

            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Colors.red,
            showUnselectedLabels: true,
            currentIndex: state.index,
            onTap: (index) {
              bottomNavBarCubit.changePage(index);
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
      },
    );
  }
}
