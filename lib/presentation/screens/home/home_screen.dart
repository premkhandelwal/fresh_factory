import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/screens/home/app_bar_widgets_home.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/brands_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';
import 'package:fresh/presentation/widgets/home/featured_product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
          )
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        // automaticallyImplyLeading: false,
        title: const AppBarWidgets(),
      ),
      body: SingleChildScrollView(
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
            SizedBox(height: 10.h),
            Container(
                height: 152.h,
                width: 380.w,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            // const SizedBox(height: 10).h,
            const CustomHeaderWidget(
              title: "Deal of the Day",
            ),
            Container(
              height: 152.h,
              width: 380.w,
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
                height: 152.h,
                width: 380.w,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            const CustomHeaderWidget(
              title: "Categories",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:  [
                    CategoriesWidget(),
                    SizedBox(width: 5.w),
                    CategoriesWidget(),
                    SizedBox(width: 5.w),
                    CategoriesWidget(),
                  ],
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
                  children:  [
                    BrandsWidget(),
                    SizedBox(width: 7.w),
                    BrandsWidget(),
                    SizedBox(width: 7.w),
                    BrandsWidget(),
                    SizedBox(width: 7.w),
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
                  children:  [
                    FeaturedProductsWidget(),
                    SizedBox(width: 7.w),
                    FeaturedProductsWidget(),
                    SizedBox(width: 7.w),
                    FeaturedProductsWidget(),
                    SizedBox(width: 7.w),
                  ],
                ),
              ),
            ),
            const CustomHeaderWidget(
              title: "Testimonial",
            ),
            Container(
                height: 142.h,
                width: 380.w,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            SizedBox(height: 10.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff02096B),
        child: const Icon(Icons.add),
      ),
    );
  }
}
