class TranslationLanguageModel {
  List<TranslationLanguage> data;
  String message;
  int code;

  TranslationLanguageModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory TranslationLanguageModel.fromJson(Map<String, dynamic> json) => TranslationLanguageModel(
    data: List<TranslationLanguage>.from(json["data"].map((x) => TranslationLanguage.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class TranslationLanguage {
  int id;
  String name;

  TranslationLanguage({
    required this.id,
    required this.name,
  });

  factory TranslationLanguage.fromJson(Map<String, dynamic> json) => TranslationLanguage(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
