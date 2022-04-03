import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/data/models/item.dart';

import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/products/product_detail_page.dart';
import 'package:fresh/presentation/screens/products/sort_filter_product_page.dart';
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
  final List<Widget> _itemSubCategory = [];
  @override
  Widget build(BuildContext context) {
    print(widget.itemCategory.masterCategory);
    for (var item in widget.itemCategory.items) {
      if (item.subcategory != null) {
        for (var subCat in item.subcategory!) {
          ItemCategory _itemCat = ItemCategory(id: "", name: subCat['Name']);
          if (!_itemSubCategory.contains(_itemCat)) {
            _itemSubCategory.add(GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => SortFilterProductPage()),
                  );
                },
                child: CategoriesWidget(itemCategory: _itemCat)));
          }
        }
      }
    }
    print(_itemSubCategory);
    return Scaffold(
      appBar: CustomAppBar(title: widget.itemCategory.name),
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
                      SizedBox(width: 5),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 5),
                      CategoriesWidget(
                          itemCategory: ItemCategory(id: "", name: "Banana")),
                      SizedBox(width: 5),
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => TempPageForProduct(
                                                item: e,
                                              )),
                                    );
                                  },
                                  child: ProductWidget(product: e),
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
  final bool isDiscount;
  const ProductWidget({
    Key? key,
    this.isDiscount = false,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // width: 120,
       width: 129,
       constraints: BoxConstraints(
    maxHeight: double.infinity,
    maxWidth: double.infinity,
    ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
    
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              height: 100,
              width: 129,
              margin: EdgeInsets.fromLTRB(47, 30, 30, 0),
              child: product.image != null
                  ? Center(
                      child: Image.network(
                        Secrets.mediaUrl + product.image!,
                        height: 100,
                        width: 129,
                        errorBuilder: (ctx, _, _1) {
                          return Container(
                            height: 28,
                            width: 43,
                          );
                        },
                      ),
                    )
                  : Container(
                      height: 28,
                      width: 43,
                    ),
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${product.minPurchaseQty}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      SizedBox(height: 7),
                      isDiscount
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "MRP: \u{20B9}",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                  TextSpan(
                                    text: "40.00",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 3.5,
                                        decorationColor: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(height: 10),
                      Text(
                        "\u{20B9}${product.mrp}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(3, 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(height: 20),
                      CircleAvatar(
                        maxRadius: 12,
                        child: Icon(
                          Icons.add,
                          size: 18,
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
