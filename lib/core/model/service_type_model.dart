class ServicesTypeModel {
  int id;
  String name;

  ServicesTypeModel({
    required this.id,
    required this.name,
  });

  factory ServicesTypeModel.fromJson(Map<String, dynamic> json) => ServicesTypeModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
