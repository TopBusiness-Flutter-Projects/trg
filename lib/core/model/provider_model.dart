class ProviderModel {
  int id;
  String name;
  String phone;
  String email;
  String image;
  dynamic address;
  int providerType;
  dynamic aboutMe;
  dynamic previousExperience;
  dynamic watts;
  dynamic experience;
  dynamic city;

  ProviderModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    this.address,
    required this.providerType,
    this.aboutMe,
    this.previousExperience,
    this.city,
    this.watts,
    this.experience,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    watts: json["watts"],
    experience: json["experience"],
    address: json["address"],
    providerType: json["provider_type"]??0,
    aboutMe: json["about_me"]??'',
    previousExperience: json["previous_experience"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "image": image,
    "address": address,
    "provider_type": providerType,
    "about_me": aboutMe,
    "previous_experience": previousExperience,
    "city": city,
    "watts": watts,
    "experience": experience,
  };
}
