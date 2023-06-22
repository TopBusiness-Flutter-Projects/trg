import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trj/features/sign_up/model/register_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/model/cities_model.dart';
import '../../../core/model/service_type_model.dart';
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
  RegisterModel registerModel = RegisterModel();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  XFile? imageFile;

  bool isLoginValid = false;

  bool isHidden = true;
  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];

  String imageType='';


  RegisterCubit(this.api) : super(RegisterInitial()){
    getCities();
    getServiceType();
  }
  pickImage({required String type,required String type1}) async {
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
    if(type1=="1") {
      registerModel.location_photo_path = croppedFile!.path;
    }
    else if (type1=="2"){
      registerModel.commericial_photo_path = croppedFile!.path;

    }
    else{
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
        cities = r.data!;
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
        serviceTypeList = r.data!;
        emit(ProviderRegisterServiceTypeLoaded());
      },
    );
  }

  void changeCity(CitiesModel? value) {
    selectedCity=value;
    emit(ProviderRegisterCitiesLoaded());

  }



  void changeServiceType(ServicesTypeModel? value) {
    selectedServiceType=value;
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
            Navigator.pushNamedAndRemoveUntil(context, Routes.providerhomePageScreenRoute, (route) => false);
            // emit(OnLoginSuccess(response));
          });
        }
      },
    );
  }

}
