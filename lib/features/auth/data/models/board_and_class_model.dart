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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['is_active'] = isActive;
    data['is_deleted'] = isDeleted;
    data['update_time'] = updateTime;
    data['insertdate'] = insertdate;
    return data;
  }
}