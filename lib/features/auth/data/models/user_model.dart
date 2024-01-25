class UserModel {
  String? code;
  String? message;
  Data? data;

  UserModel({this.code, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? countryCode;
  String? phone;
  String? token;
  String? username;
  String? profileImage;

  Data({this.id, this.countryCode, this.phone , this.token  , this.username, this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    phone = json['phone'];
    token = json['token'];
    username = json['username'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['token'] = token;
    data['username'] = username;
    data['profile_image'] = profileImage;
    return data;
  }
}