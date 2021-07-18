class HomeModel {
  late bool status;
  late HomeDataModel data;

  // value.date
  HomeModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJSON(json['data']);
  }
}

// data
class HomeDataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  HomeDataModel.fromJSON(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJSON(element));
    });
    json['products'].forEach((element) {
      products.add(ProductsModel.fromJSON(element));
    });
  }
}

// banner daa
class BannersModel {
  late int id;
  late String image;
  BannersModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

// products data
class ProductsModel {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image, name;
  late bool inFavorites, inCart;
  ProductsModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
