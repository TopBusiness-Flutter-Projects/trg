import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trj/core/model/cities_model.dart';
import 'package:trj/core/model/slider_model.dart';

import '../../../core/remote/service.dart';

part 'employment_state.dart';

class EmploymentCubit extends Cubit<EmploymentState> {
  final ServiceApi api;

  List<CitiesModel> cities = [];

  EmploymentCubit(this.api) : super(EmploymentInitial()){
    getCities();
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
}
