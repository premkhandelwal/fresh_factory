part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class FetchCategorieInProgressState extends ProductState {}

class FetchCategoriesSuccessState extends ProductState {
  final List<ItemCategory> itemCategoryList;
  FetchCategoriesSuccessState({
    required this.itemCategoryList,
  });
}

class FetchCategoriesFailureState extends ProductState {}
