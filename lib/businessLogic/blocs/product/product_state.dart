part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class FetchCategoriesInProgressState extends ProductState {}

class FetchCategoriesSuccessState extends ProductState {
  final List<ItemCategory> itemCategoryList;
  FetchCategoriesSuccessState({
    required this.itemCategoryList,
  });
}

class FetchCategoriesFailureState extends ProductState {}

class FetchProductInProgressState extends ProductState {}

class FetchProductSuccessState extends ProductState {
  final List<Item> itemList;
  FetchProductSuccessState({
    required this.itemList,
  });
}

class FetchProductFailureState extends ProductState {}
