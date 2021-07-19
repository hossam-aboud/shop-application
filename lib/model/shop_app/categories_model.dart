class CategoriesModel {
  late bool status;
  late CategoriesDataModel data;

  CategoriesModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJSON(json['data']);
  }
}

class CategoriesDataModel {
  late int currentPage;
  List<DataModel> dataModel = [];

  CategoriesDataModel.fromJSON(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      // json['data']
      dataModel.add(DataModel.fromJSON(element));
    });
  }
}

class DataModel {
  late int id;
  late String name;
  late String image;

  DataModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
