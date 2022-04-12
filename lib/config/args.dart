import 'package:flutter/cupertino.dart';

import 'package:fresh/data/models/item.dart';
import 'package:fresh/data/models/item_categories.dart';

class SendOTPArgs {
  final bool isForgotPassScreen;
  SendOTPArgs({
    required this.isForgotPassScreen,
  });
}

class VerifyOTPArgs {
  final String emailId;
  final bool isForgotPassword;
  VerifyOTPArgs({
    required this.emailId,
    required this.isForgotPassword,
  });
}

class ProductDetailPage4Args {
  final Item item;
  ProductDetailPage4Args({
    required this.item,
  });
}

class ProductsPageArgs {
  final ItemCategory itemCategory;
  final List<ItemCategory> allItemCategories;
  ProductsPageArgs({
    required this.itemCategory,
    required this.allItemCategories,
  });
}

class TempPageForProductArgs {
  final Item item;
  TempPageForProductArgs({
    required this.item,
  });
}

class WalletScreenArgs {
  final bool isRedirectedAutomatically;
  WalletScreenArgs({
    this.isRedirectedAutomatically = false,
  });
}

class HomeScreenArgs {
  final GlobalKey<NavigatorState> naviKey;
  HomeScreenArgs({
    required this.naviKey,
  });
}
