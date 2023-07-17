import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../core/model/cities_model.dart';
import '../../../core/model/provider_model.dart';
import '../../../core/model/service_type_model.dart';
import '../../../core/model/slider_model.dart';
import '../../../core/remote/service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int? servicetype;

  HomeCubit(this.api) : super(HomeInitial()){
    getSliderHome();
   // getProvidersHome();
    getCities();
    getServiceType();
  }

  getCities() async {
    emit(ProvidersHomeCitiesLoading());
    final response = await api.getCities();
    response.fold(
          (l) => emit(ProvidersHomeCitiesError()),
          (r) {
        cities = r.data;
        emit(ProvidersHomeCitiesLoaded());
      },
    );
  }

  getServiceType() async {
    emit(ProvidersHomeServiceTypeLoading());
    final response = await api.getservieType();
    response.fold(
          (l) => emit(ProvidersHomeServiceTypeError()),
          (r) {
        serviceTypeList = r.data!;
        emit(ProvidersHomeServiceTypeLoaded());
      },
    );
  }

  void changeCity(CitiesModel? value) {
    selectedCity=value;
    getProvidersHome();

    emit(ProvidersHomeCitiesLoaded());

  }

  void changeProviderType(String? value) {
    selectedProviderType=value;

    emit(ProvidersHomeLoading());
  }

  void changeServideType(ServicesTypeModel? value) {
    selectedServiceType=value;
    getProvidersHome();
    emit(ProvidersHomeLoading());
  }

  void changeIndividualType(String? value) {
    selectedIndividualType=value;


    emit(ProvidersHomeLoading());
  if(servicetype==1){
    getProvidersHome();
  }
  }
  CitiesModel? selectedCity;
  String? selectedProviderType;
  ServicesTypeModel? selectedServiceType;

  List<CitiesModel> cities = [];
  List<ServicesTypeModel> serviceTypeList = [];

  String? selectedIndividualType;
  final ServiceApi api;
  List<ProviderModel> ProvidersList = [];
  List<SliderModel> sliderList = [];

  getProvidersHome() async {
  //  print("ddldlldld0");
    print(selectedIndividualType);
    ProvidersList.clear();
    emit(ProvidersHomeLoading());
    final response = await api.getProvidersProviderFilter("",selectedProviderType==null?0: (selectedProviderType == "individual".tr()
        ? 2
        : 1),selectedCity==null?0: selectedCity!.id,selectedServiceType==null?0: selectedServiceType!.id,
       selectedIndividualType==null?0:(selectedIndividualType == "content_writer".tr()
            ? 2
            : 1));
    response.fold(
          (l) => emit(ProvidersHomeError()),
          (r) {
        ProvidersList = r.data;
        emit(ProvidersHomeLoaded());
      },
    );
  }
  getSliderHome() async {
    emit(ProvidersHomeLoading());
    final response = await api.getSlider();
    response.fold(
          (l) => emit(ProvidersHomeError()),
          (r) {
            sliderList = r.data!;
        emit(ProvidersHomeLoaded());
      },
    );
  }

  void setserviceType(int i,String? providerType,String? IndividualType,CitiesModel? value) {
    servicetype=i;
    selectedProviderType=providerType;
    selectedCity=value;
    selectedIndividualType=IndividualType;
    emit(ProvidersHomeLoading());

    getProvidersHome();
  }

}
