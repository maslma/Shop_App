class BannerModel {
  bool? status;
  String? message;
  List<Data>? data;

  BannerModel({
    this.status,
    this.message,
    this.data,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['status'] = status;
  //   data['message'] = message;
  //   if (data != null) {
  //     data['data'] = data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  String? image;
  String? category;
  String? product;

  Data({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['category'] = category;
    data['product'] = product;
    return data;
  }
}
