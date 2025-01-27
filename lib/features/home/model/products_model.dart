class ProductsModel {
  BestOffers? offers;
  Categories? categories;
  BestOffers? topSellingItems;
  BestOffers? bestOffers;

  ProductsModel({
    this.offers,
    this.categories,
    this.topSellingItems,
    this.bestOffers,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        offers: json["offers"] == null ? null : BestOffers.fromJson(json["offers"]),
        categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
        topSellingItems: json["top_selling_items"] == null ? null : BestOffers.fromJson(json["top_selling_items"]),
        bestOffers: json["best_offers"] == null ? null : BestOffers.fromJson(json["best_offers"]),
      );

  Map<String, dynamic> toJson() => {
        "offers": offers?.toJson(),
        "categories": categories?.toJson(),
        "top_selling_items": topSellingItems?.toJson(),
        "best_offers": bestOffers?.toJson(),
      };
}

class BestOffers {
  String? title;
  List<BestOffersItem>? items;

  BestOffers({
    this.title,
    this.items,
  });

  factory BestOffers.fromJson(Map<String, dynamic> json) => BestOffers(
        title: json["title"],
        items: json["items"] == null ? [] : List<BestOffersItem>.from(json["items"]!.map((x) => BestOffersItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class BestOffersItem {
  int? productId;
  String? sku;
  int? loyaltyEarningPoints;
  int? minLoyaltyPointsRequired;
  String? name;
  String? description;
  String? shortDescription;
  dynamic thumbnailImage;
  int? stockQuantity;
  bool? inStock;
  bool? featuredTag;
  bool? cancelAvailable;
  bool? returnAvailable;
  bool? replacementAvailable;
  bool? cashOnDeliveryAvailable;
  int? price;
  dynamic offerInfo;

  BestOffersItem({
    this.productId,
    this.sku,
    this.loyaltyEarningPoints,
    this.minLoyaltyPointsRequired,
    this.name,
    this.description,
    this.shortDescription,
    this.thumbnailImage,
    this.stockQuantity,
    this.inStock,
    this.featuredTag,
    this.cancelAvailable,
    this.returnAvailable,
    this.replacementAvailable,
    this.cashOnDeliveryAvailable,
    this.price,
    this.offerInfo,
  });

  factory BestOffersItem.fromJson(Map<String, dynamic> json) => BestOffersItem(
        productId: json["product_id"],
        sku: json["sku"],
        loyaltyEarningPoints: json["loyalty_earning_points"],
        minLoyaltyPointsRequired: json["min_loyalty_points_required"],
        name: json["name"],
        description: json["description"],
        shortDescription: json["short_description"],
        thumbnailImage: json["thumbnail_image"],
        stockQuantity: json["stock_quantity"],
        inStock: json["in_stock"],
        featuredTag: json["featured_tag"],
        cancelAvailable: json["cancel_available"],
        returnAvailable: json["return_available"],
        replacementAvailable: json["replacement_available"],
        cashOnDeliveryAvailable: json["cash_on_delivery_available"],
        price: json["price"],
        offerInfo: json["offer_info"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "sku": sku,
        "loyalty_earning_points": loyaltyEarningPoints,
        "min_loyalty_points_required": minLoyaltyPointsRequired,
        "name": name,
        "description": description,
        "short_description": shortDescription,
        "thumbnail_image": thumbnailImage,
        "stock_quantity": stockQuantity,
        "in_stock": inStock,
        "featured_tag": featuredTag,
        "cancel_available": cancelAvailable,
        "return_available": returnAvailable,
        "replacement_available": replacementAvailable,
        "cash_on_delivery_available": cashOnDeliveryAvailable,
        "price": price,
        "offer_info": offerInfo,
      };
}

class Categories {
  String? title;
  List<CategoriesItem>? items;

  Categories({
    this.title,
    this.items,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        title: json["title"],
        items: json["items"] == null ? [] : List<CategoriesItem>.from(json["items"]!.map((x) => CategoriesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class CategoriesItem {
  int? categoryId;
  String? categoryName;
  dynamic categoryImage;

  CategoriesItem({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  factory CategoriesItem.fromJson(Map<String, dynamic> json) => CategoriesItem(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
      };
}
