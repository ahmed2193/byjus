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
  String? birthDate;
  String? gender;
  String? address;
  String? email;
  String? schoolName;

  Data({
    this.id,
    this.countryCode,
    this.phone,
    this.token,
    this.username,
    this.profileImage,
    this.birthDate,
    this.gender,
    this.address,
    this.email,
    this.schoolName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    phone = json['phone'];
    token = json['token'];
    username = json['username'];
    profileImage = json['profile_image'];
    birthDate = json['dob'];
    gender = json['gender'];
    address = json['address'];
    email = json['email'];
    schoolName = json['school_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['token'] = token;
    data['username'] = username;
    data['profile_image'] = profileImage;
    data['dob'] = birthDate;
    data['gender'] = gender;
    data['address'] = address;
    data['email'] = email;
    data['school_name'] = schoolName;
    return data;
  }
}
