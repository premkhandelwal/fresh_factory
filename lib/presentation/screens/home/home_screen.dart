import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/brands_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';
import 'package:fresh/presentation/widgets/home/featured_product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
               /*  Container(
                      height: 152,
                      width: 380,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5)))), */
                // const SizedBox(height: 10),
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
                ),
                const CustomHeaderWidget(
                  title: "Flash Sales",
                ),
                Container(
                    height: 152,
                    width: 380,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ProductsPage(
                                            allItemCategories:
                                                _itemCategoryList,
                                            itemCategory:
                                                _itemCategoryList[index])),
                                  );
                                },
                                child: CategoriesWidget(
                                  itemCategory: _itemCategoryList[index],
                                  bgColor: Colors.green[200],
                                  borderColor: Colors.green,
                                )),
                            SizedBox(width: 5),
                          ],
                        );
                      },
                    ),
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

class CustomCarouselWidget extends StatefulWidget {
  const CustomCarouselWidget({Key? key}) : super(key: key);

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
        Positioned(
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
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _current == entry.key
                          ? Color(0xff02096B)
                          : Colors.black54),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
