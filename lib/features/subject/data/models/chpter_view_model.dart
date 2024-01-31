class ChapterViewmodel {
  String? code;
  String? message;
  List<Videos>? videos;

  ChapterViewmodel({this.code, this.message, this.videos});

  ChapterViewmodel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      videos = <Videos>[];
      json['data'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }


}

class Videos {
  String? id;
  String? questionNo;
  String? chapterId;
  String? type;
  String? title;
  String? description;
  String? videoHrs;
  String? isActive;
  String? insertdate;
  String? video;
  String? image;

  Videos(
      {this.id,
      this.questionNo,
      this.chapterId,
      this.type,
      this.title,
      this.description,
      this.videoHrs,
      this.isActive,
      this.insertdate,
      this.video,
      this.image});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionNo = json['question_no'];
    chapterId = json['chapter_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    videoHrs = json['video_hrs'];
    isActive = json['is_active'];
    insertdate = json['insertdate'];
    video = json['video'];
    image = json['image'];
  }


}