import 'package:fresh/data/models/item.dart';

class CartItem {
  Item item;
  double quantity;
  CartItem({
    required this.item,
    required this.quantity,
  });
}
