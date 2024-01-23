class BoardAndClassModel {
  String? code;
  String? message;
  List<Data>? data;

  BoardAndClassModel({this.code, this.message, this.data});

  BoardAndClassModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? image;
  String? isActive;
  String? isDeleted;
  String? updateTime;
  String? insertdate;

  Data(
      {this.id,
      this.name,
      this.image,
      this.isActive,
      this.isDeleted,
      this.updateTime,
      this.insertdate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    updateTime = json['update_time'];
    insertdate = json['insertdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['update_time'] = this.updateTime;
    data['insertdate'] = this.insertdate;
    return data;
  }
}