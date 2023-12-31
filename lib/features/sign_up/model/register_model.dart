import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';

class RegisterModel {
  int user_id=0;
  String email = '';
  String password = '';
  String name = '';
  int service_id = 0;
  int city_id = 0;
  int translation_id = 0;
  String phone = '';
  String previousExperience = '';
  String aboutMe = '';
  String address = '';
  String experienceYears = '';
  int providerType = 0;
  int individualType = 0;
  String location_photo_path = '';
  String commericial_photo_path = '';
  String experience_photo_path = '';

  bool isDataValid() {
    if (EmailValidator.validate(email) &&
        (user_id!=0||(!password.isEmpty &&
        password.length >= 6) )&&
        name.isNotEmpty &&
        service_id != 0 &&
        translation_id!=0&&
        city_id != 0 &&
        phone.isNotEmpty &&
        previousExperience.isNotEmpty &&
        aboutMe.isNotEmpty &&
        experienceYears.isNotEmpty &&
        address.isNotEmpty&&
        (user_id!=0||( providerType != 0 &&
        ((providerType == 1 &&
                commericial_photo_path.isNotEmpty &&
                location_photo_path.isNotEmpty) ||
            ((providerType == 2 ||providerType==3||providerType==4)&&
                experience_photo_path.isNotEmpty))))) {
      return true;
    }

    return false;
  }

  Future<Map<String, dynamic>> updateToJson() async => {
        "phone": phone,
        "email": email,
        "name": name,
        "password": password,
        "provider_type": providerType,
        "city_id": city_id,
        "translation_type_id": service_id,
        "language_id": translation_id,
        "address":address,
        "about_me": aboutMe,
        "experience": experienceYears,
        "previous_experience": previousExperience,
      //  "person_type": individualType,
        if (location_photo_path.isNotEmpty) ...{
          "location_image": await MultipartFile.fromFile(location_photo_path)
        },
        if (commericial_photo_path.isNotEmpty) ...{
          "commercial_register_image":
              await MultipartFile.fromFile(commericial_photo_path)
        },
        if (experience_photo_path.isNotEmpty) ...{
          "certificate_image":
              await MultipartFile.fromFile(experience_photo_path)
        }
      };
  Future<Map<String, dynamic>> updateuserToJson() async => {
        "phone": phone,
        "email": email,
        "name": name,
        "password": password,
        "city_id": city_id,
        "translation_type_id": service_id,
        "language_id": translation_id,
        "address":address,
        "about_me": aboutMe,
        "experience": experienceYears,
        "previous_experience": previousExperience,

      };
}
