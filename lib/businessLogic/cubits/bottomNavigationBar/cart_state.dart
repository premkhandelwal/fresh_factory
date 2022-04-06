part of 'cart_cubit.dart';

abstract class CartState extends Equatable{
  @override
  List<Object?> get props => [DateTime.now()];

  get item => Item(id: "", name: "");
  get quantity => 0.0;
} 

class CartChangedState extends CartState {
  final double quantity;
  final Item item;
  CartChangedState({
    required this.quantity,
    required this.item,
  });
  @override
  List<Object?> get props => [DateTime.now(), item];
}

class AddNewtoCartState extends CartState{
    final double quantity;
  final Item item;
  AddNewtoCartState({
    required this.quantity,
    required this.item,
  });
  @override
  List<Object?> get props => [DateTime.now()];
}