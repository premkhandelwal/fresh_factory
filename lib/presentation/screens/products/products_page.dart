import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/data/models/item.dart';

import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/globals.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/temp_product_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class ProductsPage extends StatefulWidget {
  final ItemCategory itemCategory;
  final List<ItemCategory> allItemCategories;
  const ProductsPage({
    Key? key,
    required this.itemCategory,
    required this.allItemCategories,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final sampleProduct = AssetImage('assets/sampleProduct.png');
  final List<CategoriesWidget> _itemSubCategory = [];
  @override
  Widget build(BuildContext context) {
    print(widget.itemCategory.masterCategory);
    for (var item in widget.itemCategory.items) {
      if (item.subcategory != null) {
        for (var subCat in item.subcategory!) {
          ItemCategory _itemCat = ItemCategory(id: "", name: subCat['Name']);
          if (!_itemSubCategory.contains(_itemCat)) {
            _itemSubCategory.add(CategoriesWidget(itemCategory: _itemCat));
          }
        }
      }
    }
    print(_itemSubCategory);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.itemCategory.name
      ),
      body: widget.itemCategory.items.isEmpty
          ? Center(
              child: Text("No Items Present in this Category"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomHeaderWidget(title: "Categories"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _itemSubCategory
                                .map((e) => e)
                                .toList() /* [
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 5.w),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 5.w),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 5.w),
                    ], */
                            ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomCarouselWidget(),
                    SizedBox(height: 20),
                    Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: widget.itemCategory.items
                            .map((e) => GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => TempPageForProduct() 
                                  ),
                                );
                              },
                              child: ProductWidget(
                                  sampleProduct: sampleProduct, product: e),
                            ))
                            .toList() /* [
                  ProductWidget(sampleProduct: sampleProduct, productName: ""),
                  ProductWidget(sampleProduct: sampleProduct, productName: ""),
                  ProductWidget(sampleProduct: sampleProduct, productName: ""),
                  ProductWidget(sampleProduct: sampleProduct, productName: "")
                ], */
                        )
                  ],
                ),
              ),
            ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Item product;
  const ProductWidget({
    Key? key,
    required this.product,
    required this.sampleProduct,
  }) : super(key: key);

  final AssetImage sampleProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: 160.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),

          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38.h,
            width: 53.w,
            margin: EdgeInsets.fromLTRB(47, 30, 30, 0),
            child: product.image != null
                ? Image.network(
                    Globals.host + product.image!,
                    height: 100.h,
                    width: 129.w,
                  )
                : Container(),
            decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${product.minPurchaseQty}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 17),
                    ),
                    SizedBox(height: 7),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "MRP: \u{20B9}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14)),
                          TextSpan(
                            text: "40.00",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 3.5,
                                decorationColor: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\u{20B9}${product.mrp}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(5, 25),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(height: 20),
                      CircleAvatar(
                        child: Icon(
                          Icons.add,
                        ),
                        backgroundColor: Colors.green,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
