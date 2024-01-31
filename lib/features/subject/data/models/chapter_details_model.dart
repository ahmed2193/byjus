class ChapterDetailsModel {
  String? code;
  String? message;
  Data? data;

  ChapterDetailsModel({this.code, this.message, this.data});

  ChapterDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? video;
  String? mcq;

  Data({this.video, this.mcq});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    mcq = json['mcq'];
  }


}