class ApiResponse {
  int status;
  Data data;

  ApiResponse({required this.status, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<Banner> bannerOne;
  List<Category> category;
  List<Product> products;
  List<Banner> bannerTwo;
  List<Product> newArrivals;
  List<Banner> bannerThree;
  List<Product> categoriesListing;
  List<Banner> topBrands;
  List<Product> brandListing;
  List<Product> topSellingProducts;
  List<Laptop> featuredLaptop;
  List<Banner> upcomingLaptops;
  List<Product> unboxedDeals;
  List<Product> myBrowsingHistory;

  Data({
    required this.bannerOne,
    required this.category,
    required this.products,
    required this.bannerTwo,
    required this.newArrivals,
    required this.bannerThree,
    required this.categoriesListing,
    required this.topBrands,
    required this.brandListing,
    required this.topSellingProducts,
    required this.featuredLaptop,
    required this.upcomingLaptops,
    required this.unboxedDeals,
    required this.myBrowsingHistory,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      bannerOne: (json['banner_one'] as List).map((e) => Banner.fromJson(e)).toList(),
      category: (json['category'] as List).map((e) => Category.fromJson(e)).toList(),
      products: (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
      bannerTwo: (json['banner_two'] as List).map((e) => Banner.fromJson(e)).toList(),
      newArrivals: (json['new_arrivals'] as List).map((e) => Product.fromJson(e)).toList(),
      bannerThree: (json['banner_three'] as List).map((e) => Banner.fromJson(e)).toList(),
      categoriesListing: (json['categories_listing'] as List).map((e) => Product.fromJson(e)).toList(),
      topBrands: (json['top_brands'] as List).map((e) => Banner.fromJson(e)).toList(),
      brandListing: (json['brand_listing'] as List).map((e) => Product.fromJson(e)).toList(),
      topSellingProducts: (json['top_selling_products'] as List).map((e) => Product.fromJson(e)).toList(),
      featuredLaptop: (json['featured_laptop'] as List).map((e) => Laptop.fromJson(e)).toList(),
      upcomingLaptops: (json['upcoming_laptops'] as List).map((e) => Banner.fromJson(e)).toList(),
      unboxedDeals: (json['unboxed_deals'] as List).map((e) => Product.fromJson(e)).toList(),
      myBrowsingHistory: (json['my_browsing_history'] as List).map((e) => Product.fromJson(e)).toList(),
    );
  }
}

class Banner {
  String banner;

  Banner({required this.banner});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      banner: json['banner'],
    );
  }
}

class Category {
  String label;
  String icon;

  Category({required this.label, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'],
      icon: json['icon'],
    );
  }
}

class Product {
  String icon;
  String offer;
  String label;
  String subLabel;
  String? sublabel;

  Product({required this.icon, required this.offer, required this.label, required this.subLabel, this.sublabel});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
      subLabel: json['SubLabel'],
      sublabel: json['Sublabel'],
    );
  }
}

class Laptop {
  String icon;
  String brandIcon;
  String label;
  String price;

  Laptop({required this.icon, required this.brandIcon, required this.label, required this.price});

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      icon: json['icon'],
      brandIcon: json['brandIcon'],
      label: json['label'],
      price: json['price'],
    );
  }
}
