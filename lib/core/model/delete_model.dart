// To parse this JSON data, do
//
//     final deleteModel = deleteModelFromJson(jsonString);

import 'dart:convert';

DeleteModel deleteModelFromJson(String str) => DeleteModel.fromJson(json.decode(str));

String deleteModelToJson(DeleteModel data) => json.encode(data.toJson());

class DeleteModel {
  dynamic data;
  String? message;
  int? code;

  DeleteModel({
    this.data,
    this.message,
    this.code,
  });

  factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
    data: json["data"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
  };
}
