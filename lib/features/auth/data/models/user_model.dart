class UserModel {
  bool? status;
  String? errNum;
  String? msg;
  User? user;

  UserModel({this.status, this.errNum, this.msg, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  UserData? userData;
  List<dynamic>? gameNames;
  String? token;

  User({this.userData, this.gameNames, this.token});

  User.fromJson(Map<String, dynamic> json) {
    userData = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    gameNames=
    json["game_names"] == null
        ? []
        : List<dynamic>.from(json["game_names"]!.map((x) => x));
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user'] = this.userData!.toJson();
    }
    data['game_names'] = this.gameNames;
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? age;
  String? weight;
  String? height;
  String? gender;

  String? createdAt;
  String? updatedAt;
  String? typeUser;
  // List<Games>? games;

  UserData({
    this.id,
    this.name,
    this.email,
    this.age,
    this.weight,
    this.height,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.typeUser,
    // this.games
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    gender = json['gender'];
    typeUser = json['type_user'];

    // if (json['games'] != null) {
    //   games = <Games>[];
    //   json['games'].forEach((v) {
    //     games!.add(new Games.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['gender'] = this.gender;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_user'] = this.typeUser;
    // if (this.games != null) {
    //   data['games'] = this.games!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Games {
  int? id;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  Pivot? pivot;
  List<Translations>? translations;

  Games(
      {this.id,
      this.status,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.pivot,
      this.translations});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['Status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Status'] = this.status;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  String? userId;
  String? gameId;

  Pivot({this.userId, this.gameId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    gameId = json['game_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['game_id'] = this.gameId;
    return data;
  }
}

class Translations {
  int? id;
  String? gameId;
  String? locale;
  String? name;

  Translations({this.id, this.gameId, this.locale, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameId = json['game_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_id'] = this.gameId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}
