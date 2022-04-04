import 'package:bloc/bloc.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';
import 'package:fresh/data/models/item_details.dart';
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
        add(FetchProductsEvent());
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
    on<FetchProductDetailsEvent>((event, emit) async {
      emit(FetchProductDetailInProgressState());
      ItemDetails? fetchItemDetails =
          await productProvider.getProductDetails(event.itemId);
      if (fetchItemDetails != null) {
        emit(FetchProductDetailSuccessState(itemList: fetchItemDetails));
      } else {
        emit(FetchProductDetailFailureState());
      }
    });
    on<AddToCartEvent>((event, emit) async {
      emit(AddtoCartInProgressState());
      bool isAdded =
          await productProvider.addtoCart(event.item, event.quantity);
      if (isAdded) {
        emit(AddtoCartSuccessState());
      } else {
        emit(AddtoCartFailureState());
      }
    });
    on<GetProductsofCategoryEvent>(
      ((event, emit) {
        List<Item> _items = event.itemList.where((element) {
          if (element.subcategory != null) {
            for (var subCat in element.subcategory!) {
              ItemCategory _itemCat =
                  ItemCategory(id: "", name: subCat['Name']);
              //To get all the item subcategories
              return _itemCat.name == event.itemCategory.name;
            }
          }
          return false;
        }).toList();
        emit(GetProductsofCategoriesState(itemList: _items));
      }),
    );
  }
}
