class HomePage {
//  int? status;
//  Data? data;
//
//  HomePage({this.status, this.data});
//
//  HomePage.fromJson(Map<String, dynamic> json) {
//   status = json['status'];
//   data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['status'] = this.status;
//   if (this.data != null) {
//    data['data'] = this.data!.toJson();
//   }
//   return data;
//  }
// }
//
// class Data {
//  List<BannerOne>? bannerOne;
//  List<Category>? category;
//  List<Products>? products;
//  List<BannerTwo>? bannerTwo;
//  List<NewArrivals>? newArrivals;
//  List<BannerThree>? bannerThree;
//  List<CategoriesListing>? categoriesListing;
//  List<TopBrands>? topBrands;
//  List<BrandListing>? brandListing;
//  List<TopSellingProducts>? topSellingProducts;
//  List<FeaturedLaptop>? featuredLaptop;
//  List<UpcomingLaptops>? upcomingLaptops;
//  List<UnboxedDeals>? unboxedDeals;
//  List<MyBrowsingHistory>? myBrowsingHistory;
//
//  Data(
//      {this.bannerOne,
//       this.category,
//       this.products,
//       this.bannerTwo,
//       this.newArrivals,
//       this.bannerThree,
//       this.categoriesListing,
//       this.topBrands,
//       this.brandListing,
//       this.topSellingProducts,
//       this.featuredLaptop,
//       this.upcomingLaptops,
//       this.unboxedDeals,
//       this.myBrowsingHistory});
//
//  Data.fromJson(Map<String, dynamic> json) {
//   if (json['banner_one'] != null) {
//    bannerOne = <BannerOne>[];
//    json['banner_one'].forEach((v) {
//     bannerOne!.add(new BannerOne.fromJson(v));
//    });
//   }
//   if (json['category'] != null) {
//    category = <Category>[];
//    json['category'].forEach((v) {
//     category!.add(new Category.fromJson(v));
//    });
//   }
//   if (json['products'] != null) {
//    products = <Products>[];
//    json['products'].forEach((v) {
//     products!.add(new Products.fromJson(v));
//    });
//   }
//   if (json['banner_two'] != null) {
//    bannerTwo = <BannerTwo>[];
//    json['banner_two'].forEach((v) {
//     bannerTwo!.add(new BannerTwo.fromJson(v));
//    });
//   }
//   if (json['new_arrivals'] != null) {
//    newArrivals = <NewArrivals>[];
//    json['new_arrivals'].forEach((v) {
//     newArrivals!.add(new NewArrivals.fromJson(v));
//    });
//   }
//   if (json['banner_three'] != null) {
//    bannerThree = <BannerThree>[];
//    json['banner_three'].forEach((v) {
//     bannerThree!.add(new BannerThree.fromJson(v));
//    });
//   }
//   if (json['categories_listing'] != null) {
//    categoriesListing = <CategoriesListing>[];
//    json['categories_listing'].forEach((v) {
//     categoriesListing!.add(new CategoriesListing.fromJson(v));
//    });
//   }
//   if (json['top_brands'] != null) {
//    topBrands = <TopBrands>[];
//    json['top_brands'].forEach((v) {
//     topBrands!.add(new TopBrands.fromJson(v));
//    });
//   }
//   if (json['brand_listing'] != null) {
//    brandListing = <BrandListing>[];
//    json['brand_listing'].forEach((v) {
//     brandListing!.add(new BrandListing.fromJson(v));
//    });
//   }
//   if (json['top_selling_products'] != null) {
//    topSellingProducts = <TopSellingProducts>[];
//    json['top_selling_products'].forEach((v) {
//     topSellingProducts!.add(new TopSellingProducts.fromJson(v));
//    });
//   }
//   if (json['featured_laptop'] != null) {
//    featuredLaptop = <FeaturedLaptop>[];
//    json['featured_laptop'].forEach((v) {
//     featuredLaptop!.add(new FeaturedLaptop.fromJson(v));
//    });
//   }
//   if (json['upcoming_laptops'] != null) {
//    upcomingLaptops = <UpcomingLaptops>[];
//    json['upcoming_laptops'].forEach((v) {
//     upcomingLaptops!.add(new UpcomingLaptops.fromJson(v));
//    });
//   }
//   if (json['unboxed_deals'] != null) {
//    unboxedDeals = <UnboxedDeals>[];
//    json['unboxed_deals'].forEach((v) {
//     unboxedDeals!.add(new UnboxedDeals.fromJson(v));
//    });
//   }
//   if (json['my_browsing_history'] != null) {
//    myBrowsingHistory = <MyBrowsingHistory>[];
//    json['my_browsing_history'].forEach((v) {
//     myBrowsingHistory!.add(new MyBrowsingHistory.fromJson(v));
//    });
//   }
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   if (this.bannerOne != null) {
//    data['banner_one'] = this.bannerOne!.map((v) => v.toJson()).toList();
//   }
//   if (this.category != null) {
//    data['category'] = this.category!.map((v) => v.toJson()).toList();
//   }
//   if (this.products != null) {
//    data['products'] = this.products!.map((v) => v.toJson()).toList();
//   }
//   if (this.bannerTwo != null) {
//    data['banner_two'] = this.bannerTwo!.map((v) => v.toJson()).toList();
//   }
//   if (this.newArrivals != null) {
//    data['new_arrivals'] = this.newArrivals!.map((v) => v.toJson()).toList();
//   }
//   if (this.bannerThree != null) {
//    data['banner_three'] = this.bannerThree!.map((v) => v.toJson()).toList();
//   }
//   if (this.categoriesListing != null) {
//    data['categories_listing'] =
//        this.categoriesListing!.map((v) => v.toJson()).toList();
//   }
//   if (this.topBrands != null) {
//    data['top_brands'] = this.topBrands!.map((v) => v.toJson()).toList();
//   }
//   if (this.brandListing != null) {
//    data['brand_listing'] =
//        this.brandListing!.map((v) => v.toJson()).toList();
//   }
//   if (this.topSellingProducts != null) {
//    data['top_selling_products'] =
//        this.topSellingProducts!.map((v) => v.toJson()).toList();
//   }
//   if (this.featuredLaptop != null) {
//    data['featured_laptop'] =
//        this.featuredLaptop!.map((v) => v.toJson()).toList();
//   }
//   if (this.upcomingLaptops != null) {
//    data['upcoming_laptops'] =
//        this.upcomingLaptops!.map((v) => v.toJson()).toList();
//   }
//   if (this.unboxedDeals != null) {
//    data['unboxed_deals'] =
//        this.unboxedDeals!.map((v) => v.toJson()).toList();
//   }
//   if (this.myBrowsingHistory != null) {
//    data['my_browsing_history'] =
//        this.myBrowsingHistory!.map((v) => v.toJson()).toList();
//   }
//   return data;
//  }
// }
//
// class BannerOne {
//  String? banner;
//
//  BannerOne({this.banner});
//
//  BannerOne.fromJson(Map<String, dynamic> json) {
//   banner = json['banner'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['banner'] = this.banner;
//   return data;
//  }
// }
//
// class Category {
//  String? label;
//  String? icon;
//
//  Category({this.label, this.icon});
//
//  Category.fromJson(Map<String, dynamic> json) {
//   label = json['label'];
//   icon = json['icon'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['label'] = this.label;
//   data['icon'] = this.icon;
//   return data;
//  }
// }
//
// class Products {
//  String? icon;
//  String? offer;
//  String? label;
//  String? subLabel;
//  String? sublabel;
//
//  Products({this.icon, this.offer, this.label, this.subLabel, this.sublabel});
//
//  Products.fromJson(Map<String, dynamic> json) {
//   icon = json['icon'];
//   offer = json['offer'];
//   label = json['label'];
//   subLabel = json['SubLabel'];
//   sublabel = json['Sublabel'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['icon'] = this.icon;
//   data['offer'] = this.offer;
//   data['label'] = this.label;
//   data['SubLabel'] = this.subLabel;
//   data['Sublabel'] = this.sublabel;
//   return data;
//  }
// }
//
// class NewArrivals {
//  String? icon;
//  String? offer;
//  String? brandIcon;
//  String? label;
//
//  NewArrivals({this.icon, this.offer, this.brandIcon, this.label});
//
//  NewArrivals.fromJson(Map<String, dynamic> json) {
//   icon = json['icon'];
//   offer = json['offer'];
//   brandIcon = json['brandIcon'];
//   label = json['label'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['icon'] = this.icon;
//   data['offer'] = this.offer;
//   data['brandIcon'] = this.brandIcon;
//   data['label'] = this.label;
//   return data;
//  }
// }
//
// class CategoriesListing {
//  String? icon;
//  String? offer;
//  String? label;
//
//  CategoriesListing({this.icon, this.offer, this.label});
//
//  CategoriesListing.fromJson(Map<String, dynamic> json) {
//   icon = json['icon'];
//   offer = json['offer'];
//   label = json['label'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['icon'] = this.icon;
//   data['offer'] = this.offer;
//   data['label'] = this.label;
//   return data;
//  }
// }
//
// class TopBrands {
//  String? icon;
//
//  TopBrands({this.icon});
//
//  TopBrands.fromJson(Map<String, dynamic> json) {
//   icon = json['icon'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['icon'] = this.icon;
//   return data;
//  }
// }
//
// class FeaturedLaptop {
//  String? icon;
//  String? brandIcon;
//  String? label;
//  String? price;
//
//  FeaturedLaptop({this.icon, this.brandIcon, this.label, this.price});
//
//  FeaturedLaptop.fromJson(Map<String, dynamic> json) {
//   icon = json['icon'];
//   brandIcon = json['brandIcon'];
//   label = json['label'];
//   price = json['price'];
//  }
//
//  Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['icon'] = this.icon;
//   data['brandIcon'] = this.brandIcon;
//   data['label'] = this.label;
//   data['price'] = this.price;
//   return data;
//  }
}
