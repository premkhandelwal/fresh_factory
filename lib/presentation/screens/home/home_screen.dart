import 'package:flutter/material.dart';
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
      // drawer: Container(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        automaticallyImplyLeading: false,
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
            const SizedBox(height: 10),
            Container(
                height: 152,
                width: 380,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoriesWidget(),
                    SizedBox(width: 5),
                    CategoriesWidget(),
                    SizedBox(width: 5),
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
                  children: const [
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
                  children: const [
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
            const SizedBox(height: 10),
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
