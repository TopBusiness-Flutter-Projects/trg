import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:trj/core/model/cities_model.dart';
import 'package:trj/core/model/slider_model.dart';

import '../../../core/model/service_type_model.dart';
import '../../../core/remote/service.dart';

part 'employment_state.dart';

class EmploymentCubit extends Cubit<EmploymentState> {
  final ServiceApi api;
  CitiesModel? selectedCity;
  String? selectedProviderType;
  ServicesTypeModel? selectedServiceType;

  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];

  String? selectedIndividualType;

  EmploymentCubit(this.api) : super(EmploymentInitial()){
    getCities();
    getServiceType();
  }

  getCities() async {
    emit(ProvidersCitiesLoading());
    final response = await api.getCities();
    response.fold(
      (l) => emit(ProvidersCitiesError()),
      (r) {
        cities = r.data!;
        emit(ProvidersCitiesLoaded());
      },
    );
  }

  getServiceType() async {
    emit(ProvidersServiceTypeLoading());
    final response = await api.getservieType();
    response.fold(
      (l) => emit(ProvidersServiceTypeError()),
      (r) {
        serviceTypeList = r.data!;
        emit(ProvidersServiceTypeLoaded());
      },
    );
  }

  void changeCity(CitiesModel? value) {
    selectedCity=value;
   emit(ProvidersCitiesLoaded());

  }

  void changeProviderType(String? value) {
    selectedProviderType=value;
    emit(ProvidersServiceTypeLoaded());

  }

  void changeServideType(ServicesTypeModel? value) {
 selectedServiceType=value;
 emit(ProvidersServiceTypeLoaded());
  }

  void changeIndividualType(String? value) {
    selectedIndividualType=value;

    emit(ProvidersServiceTypeLoaded());
  }
}
