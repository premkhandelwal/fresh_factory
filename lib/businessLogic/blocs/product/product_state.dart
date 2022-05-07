part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{
  List<Object> get props => [DateTime.now()];
}

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

  @override
  List<Object> get props => [itemList];
}

class FetchProductFailureState extends ProductState {}

class FetchProductDetailInProgressState extends ProductState {}

class FetchProductDetailSuccessState extends ProductState {
  final ItemDetails itemList;
  FetchProductDetailSuccessState({
    required this.itemList,
  });
}

class FetchProductDetailFailureState extends ProductState {}

class AddtoCartSuccessState extends ProductState {}

class AddtoCartFailureState extends ProductState {}

class AddtoCartInProgressState extends ProductState {}

class GetProductsofCategoriesState extends ProductState {
  final List<Item> itemList;
  GetProductsofCategoriesState({
    required this.itemList,
  });
}

class FetchNonLinkedCarouselDataInProgressState extends ProductState {}

class FetchNonLinkedCarouselDataSuccessState extends ProductState {
  List<CarouselItem> carouselItemList;
  FetchNonLinkedCarouselDataSuccessState({
    required this.carouselItemList,
  });
}

class FetchNonLinkedCarouselDataFailureState extends ProductState {}
