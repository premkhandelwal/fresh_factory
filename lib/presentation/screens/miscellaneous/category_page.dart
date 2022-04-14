import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/widgets/home/categories_widget.dart';

class CategoryPage extends StatefulWidget {
  static final route = "/categoryScreen";
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(FetchCategoriesEvent());
    // productBloc.add(FetchProductsEvent());
    super.initState();
  }

  List<ItemCategory> _itemCategoryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Category Page"),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is FetchCategoriesSuccessState) {
            _itemCategoryList = List.from(state.itemCategoryList);
          }
        },
        builder: (context, state) {
          if (state is FetchCategoriesInProgressState) {
            return Center(child: CircularProgressIndicator());
          }
          if (_itemCategoryList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _itemCategoryList.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProductsPage.route,
                          arguments: ProductsPageArgs(
                              itemCategory: _itemCategoryList[index],
                              allItemCategories: _itemCategoryList));
                    },
                    child: CategoriesWidget(
                      itemCategory: _itemCategoryList[index],
                      // bgColor: Colors.gsreen[200],
                      borderColor: Colors.green,
                    ),
                  );
                },
              ),
            );
          }
          return Text("No Categories Found");
        },
      ),
    );
  }
}
