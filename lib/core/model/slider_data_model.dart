// To parse this JSON data, do
//
//     final paymentPackageModel = paymentPackageModelFromJson(jsonString);

import 'dart:convert';

import 'package:trj/core/model/slider_model.dart';

class SliderDataModel {
  List<SliderModel> data;
  String message;
  int code;

  SliderDataModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory SliderDataModel.fromJson(Map<String, dynamic> json) => SliderDataModel(
    data: List<SliderModel>.from(json["data"].map((x) => SliderModel.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}


