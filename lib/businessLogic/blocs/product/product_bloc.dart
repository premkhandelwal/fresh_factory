import 'package:bloc/bloc.dart';
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
      List<ItemCategory>? fetchItemCategory =
          await productProvider.getItemCategories();
      if (fetchItemCategory != null) {
        emit(FetchCategoriesSuccessState(itemCategoryList: fetchItemCategory));
      } else {
        emit(FetchCategoriesFailureState());
      }
    });
  }
}
