/// status : true
/// message : "تمت الإضافة بنجاح"
/// data : {"id":68547,"product":{"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"}}

class FavouritesModel {
  FavouritesModel({
      this.status, 
      this.message, 
      this.data,});

  FavouritesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? FavouritesData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  FavouritesData? data;

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

/// id : 68547
/// product : {"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"}

class FavouritesData {
  FavouritesData({
      this.id, 
      });

  FavouritesData.fromJson(dynamic json) {
    id = json['id'];
  }
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;

    return map;
  }

}

/// id : 53
/// price : 5599
/// old_price : 10230
/// discount : 45
/// image : "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"

