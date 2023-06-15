import 'package:trj/core/model/service_type_model.dart';


class ServicesTypeDataModel {
  List<ServicesTypeModel> data;
  String message;
  int code;

  ServicesTypeDataModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory ServicesTypeDataModel.fromJson(Map<String, dynamic> json) => ServicesTypeDataModel(
    data: List<ServicesTypeModel>.from(json["data"].map((x) => ServicesTypeModel.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}
