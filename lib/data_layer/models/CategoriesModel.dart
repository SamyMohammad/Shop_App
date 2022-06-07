/// status : true
/// message : null
/// data : {"current_page":1,"data":[{"id":44,"name":"اجهزه الكترونيه","image":"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"},{"id":43,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"},{"id":42,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"},{"id":40,"name":"ادوات الاناره","image":"https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"},{"id":46,"name":"ملابس","image":"https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"}],"first_page_url":"https://student.valuxapps.com/api/categories?page=1","from":1,"last_page":1,"last_page_url":"https://student.valuxapps.com/api/categories?page=1","next_page_url":null,"path":"https://student.valuxapps.com/api/categories","per_page":35,"prev_page_url":null,"to":5,"total":5}

class CategoriesModel {
  CategoriesModel({
      this.status, 
      this.message, 
      this.data,});

  CategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CategoriesData.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
  CategoriesData? data;
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['status'] = status;
  //   map['message'] = message;
  //   if (data != null) {
  //     map['data'] = data?.toJson();
  //   }
  //   return map;
  // }

}

/// current_page : 1
/// data : [{"id":44,"name":"اجهزه الكترونيه","image":"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"},{"id":43,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"},{"id":42,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"},{"id":40,"name":"ادوات الاناره","image":"https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"},{"id":46,"name":"ملابس","image":"https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"}]
/// first_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// next_page_url : null
/// path : "https://student.valuxapps.com/api/categories"
/// per_page : 35
/// prev_page_url : null
/// to : 5
/// total : 5

class CategoriesData {
  CategoriesData({
      this.currentPage, 
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

  CategoriesData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryData.fromJson(v));
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
  int? currentPage;
  List<CategoryData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['current_page'] = currentPage;
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   map['first_page_url'] = firstPageUrl;
  //   map['from'] = from;
  //   map['last_page'] = lastPage;
  //   map['last_page_url'] = lastPageUrl;
  //   map['next_page_url'] = nextPageUrl;
  //   map['path'] = path;
  //   map['per_page'] = perPage;
  //   map['prev_page_url'] = prevPageUrl;
  //   map['to'] = to;
  //   map['total'] = total;
  //   return map;
  // }

}

/// id : 44
/// name : "اجهزه الكترونيه"
/// image : "https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"

class CategoryData {
  CategoryData({
      this.id, 
      this.name, 
      this.image,});

  CategoryData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? image;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['name'] = name;
  //   map['image'] = image;
  //   return map;
  // }

}