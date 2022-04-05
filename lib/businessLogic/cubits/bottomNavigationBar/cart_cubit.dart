import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh/data/models/cart_item.dart';
import 'package:fresh/data/models/item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> cartItems = [];
  CartCubit() : super(CartInitial());

  void addToCart(Item item) {
    int ind = cartItems.indexWhere((element) => element.item == item);
    if (ind == -1) {
      cartItems.add(CartItem(item: item, quantity: 1));
    } else {
      cartItems[ind].quantity += 1;
    }
  }

  void getCartItems() {
    emit(GetCartItemsState(cartItems: cartItems));
  }
}
