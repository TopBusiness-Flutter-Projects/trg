class CitiesModel {
  int id;
  String name;

  CitiesModel({
    required this.id,
    required this.name,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
