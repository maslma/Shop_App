
class categories_Model {
  late bool status;
  categoriesDataModel? data;

  categories_Model.fromJson(Map<String,dynamic> json){
   status= json['status'];
   data =  categoriesDataModel.fromJson(json['data']);
  }
}

class categoriesDataModel{
  late int currentPage;
  List<DataModel> data = [];

  categoriesDataModel.fromJson(Map<String,dynamic> json){
    currentPage= json['current_page'];
    json['data'].forEach((element){
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel{
  late int id;
  late String name;
  late String image;

  DataModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }

}