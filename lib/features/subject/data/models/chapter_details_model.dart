class SubjectModel {
  String? code;
  String? message;
  List<Data>? data;

  SubjectModel({this.code, this.message, this.data});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? id;
  String? classId;
  String? name;
  String? image;
  String? isActive;
  String? isDeleted;
  String? updatetime;
  String? insertdate;

  Data(
      {this.id,
      this.classId,
      this.name,
      this.image,
      this.isActive,
      this.isDeleted,
      this.updatetime,
      this.insertdate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['class_id'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    updatetime = json['updatetime'];
    insertdate = json['insertdate'];
  }
}
