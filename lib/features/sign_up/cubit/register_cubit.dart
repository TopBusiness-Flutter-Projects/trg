
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trj/core/model/user_model.dart';
import 'package:trj/features/sign_up/model/register_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/model/cities_model.dart';
import '../../../core/model/service_type_model.dart';
import '../../../core/model/translation_language.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/remote/service.dart';
import '../../../core/utils/appwidget.dart';
import '../../../core/utils/toast_message_method.dart';
import '../screens/sign_up.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ServiceApi api;
  CitiesModel? selectedCity;
  ServicesTypeModel? selectedServiceType;
  TranslationLanguage? selectlanguge;
  RegisterModel registerModel = RegisterModel();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  TextEditingController nameControl = TextEditingController();
  TextEditingController previousexperienceControl = TextEditingController();
  TextEditingController addressControl = TextEditingController();
  TextEditingController aboutmeControl = TextEditingController();
  TextEditingController experienceControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();

  XFile? imageFile;

  bool isLoginValid = false;

  bool isHidden = true;
  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];
  List<TranslationLanguage> translationList = [];

  String imageType = '';

  UserModel? userModel;

  RegisterCubit(this.api) : super(RegisterInitial()) {
    getCities();
    getServiceType();
    getTranslationLanguage();
    getUserData();
  }

  Future<void> getUserData() async {
    userModel = await Preferences.instance.getUserModel();
    print(userModel!.toJson());
    if (userModel!.data != null) {
      passwordControl.text='';
      emailControl.text = userModel!.data!.user.email;
      nameControl.text = userModel!.data!.user.name;
      phoneControl.text = userModel!.data!.user.phone;
      experienceControl.text = userModel!.data!.user.experience;
      previousexperienceControl.text = userModel!.data!.user.previousExperience;
      aboutmeControl.text = userModel!.data!.user.aboutMe;
      addressControl.text = userModel!.data!.user.address;

      registerModel.name=nameControl.text;
      registerModel.user_id = userModel!.data!.user.id;
      registerModel.city_id = userModel!.data!.user.city;
      registerModel.providerType = userModel!.data!.user.provider_type;
      registerModel.experienceYears = experienceControl.text;
      registerModel.individualType = userModel!.data!.user.userType;
      registerModel.phone = phoneControl.text;
      registerModel.address = addressControl.text;
      registerModel.email = emailControl.text;
      registerModel.aboutMe = aboutmeControl.text;
      registerModel.service_id = userModel!.data!.user.translation_type_id;
      registerModel.previousExperience = previousexperienceControl.text;


    }
    getCities();
    getServiceType();
    emit(OnRegisterData());
  }

  pickImage({required String type, required String type1}) async {
    imageFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    imageType = 'file';

    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 90);
    if (type1 == "1") {
      registerModel.location_photo_path = croppedFile!.path;
    } else if (type1 == "2") {
      registerModel.commericial_photo_path = croppedFile!.path;
    } else {
      registerModel.experience_photo_path = croppedFile!.path;
    }
    emit(PhotoPicked());
    checkValidLoginData();
  }

  getCities() async {
    emit(ProviderRegisterCitiesLoading());
    final response = await api.getCities();
    response.fold(
      (l) => emit(ProviderRegisterCitiesError()),
      (r) {
        cities.clear();
        cities = r.data!;
        if (userModel!.data != null) {
          for (int i = 0; i < cities.length; i++) {
            if (cities.elementAt(i).name == userModel!.data!.user.city) {
              changeCity(cities.elementAt(i));
            }
          }
        }
        emit(ProviderRegisterCitiesLoaded());
      },
    );
  }

  getServiceType() async {
    emit(ProviderRegisterServiceTypeLoading());
    final response = await api.getservieType();
    response.fold(
      (l) => emit(ProviderRegisterServiceTypeError()),
      (r) {
        serviceTypeList.clear();
        serviceTypeList = r.data!;
        if (userModel!.data != null) {
          for (int i = 0; i < serviceTypeList.length; i++) {
            if (serviceTypeList.elementAt(i).id ==
                userModel!.data!.user.translation_type_id) {
              changeServiceType(serviceTypeList.elementAt(i));
            }
          }
        }
        emit(ProviderRegisterServiceTypeLoaded());
      },
    );
  }
  getTranslationLanguage() async {
    emit(ProviderRegisterTranslationLangugeLoading());
    final response = await api.getTranslationLanguge();
    response.fold(
      (l) => emit(ProviderRegisterTranslationLangugeError()),
      (r) {
        translationList.clear();
        translationList = r.data!;
        if (userModel!.data != null) {
          for (int i = 0; i < translationList.length; i++) {
            if (translationList.elementAt(i).id ==
                userModel!.data!.user.translation_id) {
              changeTranslationLanguge(translationList.elementAt(i));
            }
          }
        }
        emit(ProviderRegisterTranslationLangugeLoaded());
      },
    );
  }

  void changeCity(CitiesModel? value) {
    selectedCity = value;
    registerModel.city_id=value!.id;


    emit(ProviderRegisterCitiesLoaded());
  }

  void changeServiceType(ServicesTypeModel? value) {
    selectedServiceType = value;
    registerModel.service_id=value!.id;

    emit(ProviderRegisterServiceTypeLoaded());
  }

  void changeServiceProviderType(IndividualProvider? value) {
    //selectedProviderType=value;
    selectedIndividualProvider = value!;
    emit(ProviderRegisterTypeLoaded());
  }

  void checkValidLoginData() {
    if (registerModel.isDataValid()) {
      isLoginValid = true;
      emit(OnRegisterVaild());
    } else {
      isLoginValid = false;

      emit(OnLoginVaildFaild());
    }
  }

  void changeHidden() {
    isHidden = !isHidden;
    emit(RegisterInitial());
  }
  // void changeUpdateHidden() {
  //   isRegister = !isRegister;
  //   emit(UpdateHiddenState());
  // }

  void changeProviderType(ServiceProvider? value) {
    //selectedProviderType=value;
    selectedServiceProvider = value!;
    emit(ProviderRegisterServiceTypeLoaded());
  }

  void register(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    final response = await api.registerUser(registerModel);
    response.fold(
      (failure) => {Navigator.pop(context), emit(RegisterFailure())},
      (loginModel) {
        if (loginModel.code == 409) {
          Navigator.pop(context);
          toastMessage("exists_email".tr(), context);
          // errorGetBar(translateText(AppStrings.noEmailError, context));
          emit(RegisterFailure());
        } else if (loginModel.code == 200) {
          Navigator.pop(context);
          Preferences.instance.setUser(loginModel).then((value) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.providerhomePageScreenRoute, (route) => false);
            // emit(OnLoginSuccess(response));
          });
        }
      },
    );
  }
  void update(BuildContext context) async {
    print("*********************************************");
    print(registerModel.phone);
    registerModel.phone=phoneControl.text;
    print(registerModel.phone);

    AppWidget.createProgressDialog(context, 'wait'.tr());
    final response = await api.UpdateUser(registerModel);
    response.fold(
          (failure) => {Navigator.pop(context), emit(RegisterFailure())},
          (loginModel) {
        if (loginModel.code == 409) {
          Navigator.pop(context);
          toastMessage("exists_email".tr(), context);
          // errorGetBar(translateText(AppStrings.noEmailError, context));
          emit(RegisterFailure());
        } else if (loginModel.code == 200) {
          Navigator.pop(context);
          Preferences.instance.setUser(loginModel).then((value) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.providerhomePageScreenRoute, (route) => false);
            // emit(OnLoginSuccess(response));
          });
        }
      },
    );
  }

  void changeTranslationLanguge(TranslationLanguage? value) {
    selectlanguge=value;
    registerModel.translation_id=value!.id;

    emit(ProviderRegisterTranslationLangugeLoaded());
  }
}
