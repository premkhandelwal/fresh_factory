import 'package:bloc/bloc.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:meta/meta.dart';

import 'package:fresh/data/dataProviders/product_provider.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductProvider productProvider;
  ProductBloc({
    required this.productProvider,
  }) : super(ProductInitial()) {
    on<FetchCategoriesEvent>((event, emit) async {
      emit(FetchCategoriesInProgressState());
      List<ItemCategory>? fetchItemCategory =
          await productProvider.getItemCategories();
      if (fetchItemCategory != null) {
        emit(FetchCategoriesSuccessState(itemCategoryList: fetchItemCategory));
      } else {
        emit(FetchCategoriesFailureState());
      }
    });
    on<FetchProductsEvent>((event, emit) async {
      emit(FetchProductInProgressState());
      List<Item>? fetchItemCategory = await productProvider.getProducts();
      if (fetchItemCategory != null) {
        emit(FetchProductSuccessState(itemList: fetchItemCategory));
      } else {
        emit(FetchProductFailureState());
      }
    });
  }
}
