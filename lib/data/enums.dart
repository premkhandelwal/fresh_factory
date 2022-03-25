enum SortOptions {
  newArrivals,
  highestSelling,
  topRated,
  priceHigh,
  priceLow,
  discountHigh,
  discountLow,
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
      default:
        return "";
    }
  }
}

enum FilterOptions {
  delivery,
  shippingOptions,
  categories,
  healthPersonalCare,
  brands,
  priceDeals
}

extension GetStringValforFilterOption on FilterOptions {
  String get value {
    switch (this) {
      case FilterOptions.delivery:
        return "Delivery";
      case FilterOptions.shippingOptions:
        return "Shipping Options";
      case FilterOptions.categories:
        return "Categories";
      case FilterOptions.healthPersonalCare:
        return "Health & Personal Care";
      case FilterOptions.brands:
        return "Brands";
      case FilterOptions.priceDeals:
        return "Price Deals";
      default:
        return "";
    }
  }
}