import 'package:email_validator/email_validator.dart';

class RegisterModel {
  String email = '';
  String password = '';
  String name = '';
  int service_id = 0;
  int city_id = 0;
  String phone = '';
  String previousExperience = '';
  String aboutMe = '';
  String experienceYears = '';
  int providerType = 0;
  int indvidualType = 0;

  bool isDataValid() {
    if (EmailValidator.validate(email) &&
        !password.isEmpty &&
        password.length >= 6&&name.isNotEmpty&&service_id!=0&&city_id!=0&&phone.isNotEmpty&&previousExperience.isNotEmpty&&aboutMe.isNotEmpty&&experienceYears.isNotEmpty&&providerType!=0&&(providerType==1||(providerType==1&&indvidualType!=0))) {

      return true;
    }

    return false;
  }
}
