class SliderModel {
  int id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  SliderModel({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json["id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
