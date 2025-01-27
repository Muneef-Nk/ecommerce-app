// To parse this JSON data, do
//
//     final loginSuccessModel = loginSuccessModelFromJson(jsonString);

import 'dart:convert';

LoginSuccessModel loginSuccessModelFromJson(String str) => LoginSuccessModel.fromJson(json.decode(str));

String loginSuccessModelToJson(LoginSuccessModel data) => json.encode(data.toJson());

class LoginSuccessModel {
  bool? status;
  String? message;
  User? user;
  String? accessToken;
  String? refreshToken;

  LoginSuccessModel({
    this.status,
    this.message,
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class User {
  int? userId;
  dynamic shopId;
  String? email;
  String? phoneNumber;
  String? name;
  String? profileImage;
  int? userRole;
  String? gender;
  int? age;
  dynamic roles;

  User({
    this.userId,
    this.shopId,
    this.email,
    this.phoneNumber,
    this.name,
    this.profileImage,
    this.userRole,
    this.gender,
    this.age,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        shopId: json["shop_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        profileImage: json["profile_image"],
        userRole: json["user_role"],
        gender: json["gender"],
        age: json["age"],
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "shop_id": shopId,
        "email": email,
        "phone_number": phoneNumber,
        "name": name,
        "profile_image": profileImage,
        "user_role": userRole,
        "gender": gender,
        "age": age,
        "roles": roles,
      };
}
