class searchModel {
  late bool status;
  String? message;
  Data? data;

  searchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ?  Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  late int currentPage;
  List<Product> data = [];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late String path;
  late int perPage;
  late int to;
  late int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(Product.fromJson(element));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}


class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    //oldPrice = json['old_price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}
