
class home_model {
  late bool status;
  homeDataModel? data;

  home_model.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = homeDataModel.fromJson(json['data']);

  }
}

class homeDataModel{

  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  homeDataModel.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element){
      products.add(ProductModel.fromJson(element));
    });
  }

}

class BannerModel{
  late int id;
  late String image;

  BannerModel.fromJson(Map<String,dynamic> json){
    id= json['id'] ;
    image=json['image'] ;
  }

}

class ProductModel{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorite;
  late bool in_cart;

  ProductModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    in_favorite = json['in_favorites'];
    in_cart=json['in_cart'];

  }


}