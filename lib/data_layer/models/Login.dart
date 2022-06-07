/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// data : {"id":14409,"name":"samy mohamed","email":"samym@gmail.com","phone":"0151732156999","image":"https://student.valuxapps.com/storage/assets/defaults/user.jpg","points":0,"credit":0,"token":"iykqj4sMF4fIukwPVPyXez0pu6nNuAGfz3D3NWt92R3wVT0Lh7VESE8QEoPjKj9VWwwgDc"}

class Login {
  Login({
      this.status, 
      this.message, 
      this.data,});

  Login.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  UserData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 14409
/// name : "samy mohamed"
/// email : "samym@gmail.com"
/// phone : "0151732156999"
/// image : "https://student.valuxapps.com/storage/assets/defaults/user.jpg"
/// points : 0
/// credit : 0
/// token : "iykqj4sMF4fIukwPVPyXez0pu6nNuAGfz3D3NWt92R3wVT0Lh7VESE8QEoPjKj9VWwwgDc"

class UserData {
  UserData({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.points, 
      this.credit, 
      this.token,});

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['points'] = points;
    map['credit'] = credit;
    map['token'] = token;
    return map;
  }

}