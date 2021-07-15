class ShopLoginModel {
  late bool status;
  late String message;
  late UserData? data;

  ShopLoginModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJSON(json['data']) : null;
  }
}

class UserData {
  late int id, points, credit;
  late String name, email, phone, image, token;
  // UserData(
  //     {this.id,
  //     this.name,
  //     this.email,
  //     this.phone,
  //     this.image,
  //     this.points,
  //     this.credit,
  //     this.token});

  UserData.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
