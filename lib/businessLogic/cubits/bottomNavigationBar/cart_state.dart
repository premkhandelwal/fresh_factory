part of 'cart_cubit.dart';

abstract class CartState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class AddToCartState extends CartState {}

class GetCartItemsState extends CartState {
  final List<CartItem> cartItems;
  GetCartItemsState({
    required this.cartItems,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [DateTime.now()];
}
