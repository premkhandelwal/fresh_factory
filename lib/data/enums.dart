enum SortOptions {
  newArrivals,
  highestSelling,
  topRated,
  discountHigh,
  discountLow,
  priceLow,
  priceHigh,
  nameAZ,
  nameZA
}

extension GetStringValforSortOption on SortOptions {
  String get value {
    switch (this) {
      case SortOptions.newArrivals:
        return "New Arrivals";
      case SortOptions.highestSelling:
        return "Highest Selling";
      case SortOptions.topRated:
        return "Top Rated";
      case SortOptions.priceLow:
        return "Price Low-High";
      case SortOptions.priceHigh:
        return "Price High-low";
      case SortOptions.discountLow:
        return "Discount Low-High";
      case SortOptions.discountHigh:
        return "Discount High-low";
      case SortOptions.nameAZ:
        return "Name A-Z";
      case SortOptions.nameZA:
        return "Name Z-A";
      default:
        return "";
    }
  }
}

enum FilterOptions {
  categories,
  brands,
  type,
  weight,
}

extension GetStringValforFilterOption on FilterOptions {
  String get value {
    switch (this) {
      case FilterOptions.type:
        return "Type";
      case FilterOptions.weight:
        return "Weight";
      case FilterOptions.categories:
        return "Category";
      case FilterOptions.brands:
        return "Brand";
      default:
        return "";
    }
  }
}

enum WalletTransferOptions{
  toBank,
  toWallet
}