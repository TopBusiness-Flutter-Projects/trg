import 'cities_model.dart';

class CitiesDataModel {
  List<CitiesModel> data;
  String message;
  int code;

  CitiesDataModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory CitiesDataModel.fromJson(Map<String, dynamic> json) => CitiesDataModel(
    data: List<CitiesModel>.from(json["data"].map((x) => CitiesModel.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}
