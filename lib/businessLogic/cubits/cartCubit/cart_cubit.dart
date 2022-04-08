// Not using this anymore. Using CartClass instead

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh/data/models/cart_item.dart';
import 'package:fresh/data/models/item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartChangedState(quantity: 0, item: Item(id: "", name: "")));
  List<CartItem> _cartItems = [];
  double _totalAmount = 0.0;

  List<CartItem> get getCartItems => _cartItems;
  double get totalAmount => _totalAmount;


  void addToCart(Item cartItem) {
    int ind = _cartItems.indexWhere((element) => element.item == cartItem);
    if (ind == -1) {
      _totalAmount += cartItem.mrp ?? 0.0;
      _cartItems.add(CartItem(item: cartItem, quantity: 1));
      emit(AddNewtoCartState(quantity: 1, item: cartItem));
    } else {
      _cartItems[ind].quantity += 1;
      _totalAmount += cartItem.mrp ?? 0.0;
      emit(CartChangedState(quantity: _cartItems[ind].quantity, item: cartItem));
    }
    
    
  }

  void removeFromCart(Item cartItem) {
    CartItem _item =
        _cartItems.firstWhere((element) => element.item == cartItem);
    _item.quantity -= 1;
    _totalAmount -= cartItem.mrp ?? 0.0;
    emit(CartChangedState(quantity: _item.quantity, item: cartItem));
  }

  /* void getIndividualQty(Item cartItem) {
    CartItem _item =
        _cartItems.firstWhere((element) => element.item == cartItem);
    emit(CartState(quantity: _cartItems[ind].quantity));


  } */
}
