import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/businessLogic/cubits/cartCubit/cart_cubit.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/products/product_detail_page4.dart';
import 'package:fresh/presentation/screens/products/temp_product_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class ProductsPage extends StatefulWidget {
  static String route = '/productsPageScreen';

  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final sampleProduct = AssetImage('assets/sampleProduct.png');
  final List<ItemCategory> _itemSubCategory = [];
  late ProductBloc productBloc;
  late ProductsPageArgs args;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      productBloc = BlocProvider.of<ProductBloc>(context);
      print(args.itemCategory.masterCategory);
      // for (var item in widget.itemCategory.items) {}
      for (var item in args.itemCategory.items) {
        if (item.subcategory != null) {
          for (var subCat in item.subcategory!) {
            // ItemCategory _itemCat = widget.allItemCategories
            // .firstWhere((element) => element.name == subCat['Name']);
            ItemCategory _itemCat = ItemCategory(id: "", name: subCat['Name']);
            //To get all the item subcategories
            if (!_itemSubCategory.contains(_itemCat)) {
              _itemSubCategory.add(_itemCat);
            }
          }
        }
      }
      print(_itemSubCategory);
      if (_itemSubCategory.isNotEmpty) {
        productBloc.add(GetProductsofCategoryEvent(
            itemCategory: _itemSubCategory[0],
            itemList: args.itemCategory.items));
      }
      setState(() {});
    });
  }

  List<Item> categoryWiseProductList = [];
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductsPageArgs;

    return Scaffold(
      appBar: CustomAppBar(title: args.itemCategory.name),
      // bottomNavigationBar: BottomNavBarWidget(),
      body: args.itemCategory.items.isEmpty
          ? Center(
              child: Text("No Items Present in this Category"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomHeaderWidget(title: "Sub-Categories"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _itemSubCategory
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      productBloc.add(
                                          GetProductsofCategoryEvent(
                                              itemCategory: e,
                                              itemList:
                                                  args.itemCategory.items));
                                      /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                SortFilterProductPage()),
                                      ); */
                                    },
                                    child: CategoriesWidget(
                                      itemCategory: e,
                                      borderColor: Colors.green,
                                    ),
                                  ),
                                )
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
                    BlocConsumer<ProductBloc, ProductState>(
                      listener: (context, state) {
                        if (state is GetProductsofCategoriesState) {
                          categoryWiseProductList = List.from(state.itemList);
                          print(state.itemList);
                        }
                      },
                      builder: (context, state) {
                        return Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: categoryWiseProductList
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                  context,
                  ProductDetailPage4.route,
                  arguments: ProductDetailPage4Args(item: e)
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

                            /* return Wrap(
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: widget.itemCategory.items
                                                .map((e) => GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  TempPageForProduct(
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
                                            );
                     */
                            );
                      },
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
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      height: 280,
      // width: 120,
      width: 150,
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
          Container(
            height: 100,
            width: 150,
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
          SizedBox(height: 10),
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
                        style: TextStyle(color: Colors.black, fontSize: 15),
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
                      Center(
                        child: IconButton(
                          onPressed: () {
                            cartCubit.addToCart(product);
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 28,
                          ),
                        ),
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
