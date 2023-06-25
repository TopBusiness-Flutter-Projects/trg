// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

UserModel loginModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String loginModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.data,
    this.message,
    this.code,
  });

  final Data? data;
  final String? message;
  final int? code;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "code": code,
      };
}

class Data {
  Data({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  User user;
  String accessToken;
  String tokenType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

class User {
  int id;
  String name;
  String phone;
  String email;
  String address;
  int status;
  String image;
  int userType;
  int provider_type;
  int translation_type_id;
  dynamic aboutMe;
  dynamic previousExperience;
  dynamic watts;
  dynamic experience;
  dynamic city;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.provider_type,
    required this.address,
    required this.status,
    required this.translation_type_id,
    required this.image,
    required this.userType,
    this.aboutMe,
    this.previousExperience,
    this.city,
    this.watts,
    this.experience,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    status: json["status"],
    image: json["image"],
    userType: json["user_type"],
    translation_type_id: json["translation_type_id"]??0,
    watts: json["watts"],
    experience: json["experience"],
    aboutMe: json["about_me"]??'',
    previousExperience: json["previous_experience"],
    city: json["city"],
    provider_type: json["provider_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "status": status,
    "image": image,
    "user_type": userType,
    "translation_type_id": translation_type_id,
    "about_me": aboutMe,
    "previous_experience": previousExperience,
    "city": city,
    "watts": watts,
    "experience": experience,
    "provider_type": provider_type,
  };
}

