class CategoryModel {
  bool? status;
  String? message;
  Data? data;

  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['status'] = status;
  //   data['message'] = message;
  //   if (data != null) {
  //     data['data'] = data.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  int? currentPage;
  List<DataItem>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total,});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DataItem.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  {};
  //   data['current_page'] = currentPage;
  //   if (data != null) {
  //     data['data'] = data.map((v) => v.toJson()).toList();
  //   }
  //   data['first_page_url'] = firstPageUrl;
  //   data['from'] = from;
  //   data['last_page'] = lastPage;
  //   data['last_page_url'] = lastPageUrl;
  //   data['next_page_url'] = nextPageUrl;
  //   data['path'] = path;
  //   data['per_page'] = perPage;
  //   data['prev_page_url'] = prevPageUrl;
  //   data['to'] = to;
  //   data['total'] = total;
  //   return data;
  // }
}

class DataItem {
  int? id;
  String? name;
  String? image;

  DataItem({
    this.id,
    this.name,
    this.image,
  });

  DataItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
