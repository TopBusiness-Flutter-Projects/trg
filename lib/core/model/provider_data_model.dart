import 'package:trj/core/model/provider_model.dart';

class ProviderDataModel {
  List<ProviderModel> data;
  String message;
  int code;

  ProviderDataModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory ProviderDataModel.fromJson(Map<String, dynamic> json) => ProviderDataModel(
    data: List<ProviderModel>.from(json["data"].map((x) => ProviderModel.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}
