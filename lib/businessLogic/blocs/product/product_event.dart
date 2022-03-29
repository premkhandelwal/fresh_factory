part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchCategoriesEvent extends ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class FetchProductDetailsEvent extends ProductEvent {
  final String itemId;
  FetchProductDetailsEvent({
    required this.itemId,
  });
}

class AddToCartEvent extends ProductEvent {
  final Item item;
  final int quantity;
  AddToCartEvent({
    required this.item,
    required this.quantity,
  });
}
