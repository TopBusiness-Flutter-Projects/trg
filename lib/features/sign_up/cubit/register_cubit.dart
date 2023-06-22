import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:trj/features/sign_up/model/register_model.dart';

import '../../../core/model/cities_model.dart';
import '../../../core/model/service_type_model.dart';
import '../../../core/remote/service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ServiceApi api;
  CitiesModel? selectedCity;
  ServicesTypeModel? selectedServiceType;
  String? selectedProviderType;
  RegisterModel registerModel = RegisterModel();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  bool isLoginValid = false;

  bool isHidden = true;
  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];

  String? selectedIndividualType;

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



  void changeServideType(ServicesTypeModel? value) {
    selectedServiceType=value;
    emit(ProviderRegisterServiceTypeLoaded());
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
  void changeProviderType(String? value) {
    selectedProviderType=value;
    emit(ProviderRegisterServiceTypeLoaded());

  }
}
