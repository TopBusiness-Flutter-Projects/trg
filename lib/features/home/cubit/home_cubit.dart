import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/model/slider_model.dart';
import '../../../core/remote/service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial()){
    getSliderHome();
    getProvidersHome();
  }
  final ServiceApi api;
  List<ProviderModel> ProvidersList = [];
  List<SliderModel> sliderList = [];

  getProvidersHome() async {
    emit(ProvidersHomeLoading());
    final response = await api.getProvidersHome();
    response.fold(
          (l) => emit(ProvidersHomeError()),
          (r) {
        ProvidersList = r.data!;
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
}
