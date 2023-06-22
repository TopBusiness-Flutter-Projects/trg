import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trj/features/sign_up/model/register_model.dart';

import '../../../core/model/cities_model.dart';
import '../../../core/model/service_type_model.dart';
import '../../../core/remote/service.dart';
import '../screens/sign_up.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ServiceApi api;
  CitiesModel? selectedCity;
  ServicesTypeModel? selectedServiceType;
  RegisterModel registerModel = RegisterModel();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  bool isLoginValid = false;

  bool isHidden = true;
  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];


  RegisterCubit(this.api) : super(RegisterInitial()){
    getCities();
    getServiceType();
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

  imagePicker(BuildContext context) {
    //emit(logoImageLoading());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Pick from gallery'),
                  // onTap: () async {
                  //   serviceLogoImage =
                  //   await picker.pickImage(source: ImageSource.gallery);
                  //   emit(logoImageSuccess());
                  //   Navigator.of(context).pop();
                  // },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Take a photo'),
                  // onTap: () async {
                  //   serviceLogoImage =
                  //   await picker.pickImage(source: ImageSource.camera);
                  //   emit(logoImageSuccess());
                  //   Navigator.of(context).pop();
                  // },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
