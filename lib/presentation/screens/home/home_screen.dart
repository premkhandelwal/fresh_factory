import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/businessLogic/cubits/bottomNavBarCubit/bottom_nav_bar_cubit.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/widgets/bottom_nav_bar.dart';
import 'package:fresh/presentation/screens/auth/changePassword.dart';
import 'package:fresh/presentation/screens/home/app_bar_widgets_home.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';
import 'package:fresh/presentation/screens/payments/bank_details_screen.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/screens/profile/edit_profile_details_page.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/brands_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';
import 'package:fresh/presentation/widgets/home/deal_for_the_day_widget.dart';
import 'package:fresh/presentation/widgets/home/exclusive_product_widget.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<NavigatorState> naviKey;
  static String route = '/homeScreen';

  const HomePage({
    Key? key,
    required this.naviKey,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final instaLogo = AssetImage('assets/instagram.png');

  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(FetchCategoriesEvent());
    // productBloc.add(FetchProductsEvent());
    super.initState();
  }

  List<ItemCategory> _itemCategoryList = [];
  List<Item> _itemList = [];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      /* bottomNavigationBar:  BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return BottomNavBarWidget();
        },
      ), */
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        // automaticallyImplyLeading: false,
        title: const AppBarWidgets(),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is FetchCategoriesSuccessState) {
            _itemCategoryList = List.from(state.itemCategoryList);
            print(_itemCategoryList);
          } else if (state is FetchProductSuccessState) {
            _itemList = List.from(state.itemList);
            for (var item in _itemList) {
              if (item.category != null) {
                int ind = _itemCategoryList.indexWhere((element) {
                  if (item.category![0]['Name'].toString().toLowerCase() ==
                      element.name.toLowerCase()) {
                    return true;
                  }
                  return false;
                });
                _itemCategoryList[ind].items.add(item);
              }
            }
            // 123456789
            // print(_itemList);
            print(_itemCategoryList);
          }
        },
        builder: (context, state) {
          if (state is FetchCategoriesInProgressState ||
              state is FetchProductInProgressState) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.red,
                          size: 30,
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(4),
                  color: Color(0xff02096B),
                  child: const Text(
                    "",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(height: 10),
                CustomCarouselWidget(),
                SizedBox(height: 10),
                /*  Container(
                      height: 152,
                      width: 380,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5)))), */
                // const SizedBox(height: 10),
                /* //?<Deal of the day 
               const CustomHeaderWidget(
                  title: "Deal of the Day",
                ),
                Container(
                  height: 152,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),//?> 
                */
                const CustomHeaderWidget(
                  title: "Categories",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 131,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _itemCategoryList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  widget.naviKey.currentState!
                                      .pushNamed(ProductsPage.route,arguments: ProductsPageArgs(
                                          itemCategory:
                                              _itemCategoryList[index],
                                          allItemCategories:
                                              _itemCategoryList));
                                },
                                child: CategoriesWidget(
                                  itemCategory: _itemCategoryList[index],
                                  // bgColor: Colors.gsreen[200],
                                  borderColor: Colors.green,
                                )),
                            SizedBox(width: 5),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: const CustomHeaderWidget(
                        title: "Flash Sales",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 35,
                        width: 132,
                        decoration: BoxDecoration(
                            color: Color(0xff02096B),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            TimerChildWidget(text: "00"),
                            SizedBox(width: 5),
                            TimerChildWidget(text: "01"),
                            SizedBox(width: 5),
                            TimerChildWidget(text: "45"),
                            SizedBox(width: 5),
                            TimerChildWidget(text: "56"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    height: 152,
                    width: 380,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "New Arrivals",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProductWidget(
                            product: Item(
                                id: "",
                                name: "Banana",
                                minPurchaseQty: 2,
                                mrp: 20)),
                        SizedBox(width: 5),
                        ProductWidget(
                            product: Item(
                                id: "",
                                name: "Banana",
                                minPurchaseQty: 2,
                                mrp: 20)),
                        SizedBox(width: 5),
                        ProductWidget(
                            product: Item(
                                id: "",
                                name: "Banana",
                                minPurchaseQty: 2,
                                mrp: 20)),
                        SizedBox(width: 5),
                        ProductWidget(
                            product: Item(
                                id: "",
                                name: "Banana",
                                minPurchaseQty: 2,
                                mrp: 20)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Exclusive Offer",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ExclusiveOfferWidget(),
                        SizedBox(width: 7),
                        ExclusiveOfferWidget(),
                        SizedBox(width: 7),
                        ExclusiveOfferWidget(),
                        SizedBox(width: 7),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Festival Offer",
                ),
                SizedBox(height: 10),

                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Deal for the Day",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    shrinkWrap: true,
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4),
                    children: List.generate(18, (index) => DealofDayWidget()),
                  ),
                ),
                const CustomHeaderWidget(
                  title: "Top Brands",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BrandsWidget(),
                        SizedBox(width: 7),
                        BrandsWidget(),
                        SizedBox(width: 7),
                        BrandsWidget(),
                        SizedBox(width: 7),
                        BrandsWidget(),
                      ],
                    ),
                  ),
                ),
                const CustomHeaderWidget(
                  title: "Taste of India",
                ),
                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Organic Store",
                ),
                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Refer and Earn",
                ),
                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),

                const CustomHeaderWidget(
                  title: "Sample1",
                ),
                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Sample1",
                ),
                CustomCarouselWidget(showDots: false),
                SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Sample1",
                ),
                CustomCarouselWidget(showDots: false),
                /* SizedBox(height: 10),
                const CustomHeaderWidget(
                  title: "Featured Product",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FeaturedProductsWidget(),
                        SizedBox(width: 7),
                        FeaturedProductsWidget(),
                        SizedBox(width: 7),
                        FeaturedProductsWidget(),
                        SizedBox(width: 7),
                      ],
                    ),
                  ),
                ),
     */
                const CustomHeaderWidget(
                  title: "Testimonial",
                ),
                Container(
                    height: 142,
                    width: 380,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff02096B),
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
          height: 177,
          width: 318,
          child: DrawerHeader(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    height: 76,
                    width: 76,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Anna Deo',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 10),
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
                Navigator.pushNamed(
                  context,
                  EditProfileDetailsPage.route,
                );
              },
            ),
            ListTile(
              title: Text("Bank Info"),
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 64),
              visualDensity: VisualDensity(horizontal: 1, vertical: -4),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  BankDetailsScreen.route,
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
            Navigator.pushNamed(
              context,
              WalletScreen.route,
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
            /* Navigator.pushNamed(
              context,
               OrderMainPage.route,
            ); */
            /* Navigator.pushNamed(
              context,
              OrderMainPage.route,
            ); */
          },
        ),
        ListTile(
          leading: Icon(Icons.local_offer_outlined, color: Colors.pink),
          title: Text("My Offers"),
          minLeadingWidth: 8,
          onTap: () {
            Navigator.pushNamed(
              context,
              OfferPage.route,
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
        ListTile(
          leading: Icon(Icons.password, color: Colors.pink),
          title: Text("Change Password"),
          minLeadingWidth: 8,
          onTap: () {
            Navigator.pushNamed(
              context,
              ChangePassword.route,
            );
          },
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

class TimerChildWidget extends StatelessWidget {
  final String text;
  const TimerChildWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 25,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}

class CustomCarouselWidget extends StatefulWidget {
  final bool showDots;
  const CustomCarouselWidget({Key? key, this.showDots = true})
      : super(key: key);

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> imgList = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            height: 152,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            height: 152,
            // margin: EdgeInsets.all(6.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            height: 152,
            width: 380,
            // margin: EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    ];
    return Stack(
      // mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: imgList,
          options: CarouselOptions(
              height: 152,
              enableInfiniteScroll: false,
              viewportFraction: 0.95,
              // viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        widget.showDots
            ? Positioned(
                bottom: 3,
                left: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _current == entry.key ? 25.0 : 12,
                        height: _current == entry.key ? 12 : 18.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _current == entry.key
                                ? Color(0xff02096B)
                                : Colors.black54),
                      ),
                    );
                  }).toList(),
                ),
              )
            : Container(),
      ],
    );
  }
}
