class SubjectChapterModel {
  String? code;
  String? message;
  Data? data;

  SubjectChapterModel({this.code, this.message, this.data});

  SubjectChapterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? totalChapter;
  List<ChapterList>? chapterList;

  Data({this.totalChapter, this.chapterList});

  Data.fromJson(Map<String, dynamic> json) {
    totalChapter = json['total_chapter'];
    if (json['chapter_list'] != null) {
      chapterList = <ChapterList>[];
      json['chapter_list'].forEach((v) {
        chapterList!.add(ChapterList.fromJson(v));
      });
    }
  }

}

class ChapterList {
  String? id;
  String? subjectId;
  String? title;
  String? name;
  String? image;
  String? isActive;
  String? isDeleted;
  String? insertdate;
  String? classId;

  ChapterList(
      {this.id,
      this.subjectId,
      this.title,
      this.name,
      this.image,
      this.isActive,
      this.isDeleted,
      this.insertdate,
      this.classId});

  ChapterList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    title = json['title'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    insertdate = json['insertdate'];
    classId = json['class_id'];
  }


}