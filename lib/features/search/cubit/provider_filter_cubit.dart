import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/model/slider_model.dart';
import '../../../core/remote/service.dart';

part 'provider_filter_state.dart';

class ProviderSearchCubit extends Cubit<ProvidersSearchState> {
  ProviderSearchCubit(this.api) : super(ProvidersSearchInitial()){
getProvidersSearch("");
  }
  final ServiceApi api;
  List<ProviderModel> ProvidersList = [];

  getProvidersSearch(String search_key) async {
    emit(ProvidersSearchLoading());
    final response = await api.getProvidersProviderFilter(search_key,0,0,0);
    response.fold(
          (l) => emit(ProvidersSearchError()),
          (r) {
        ProvidersList = r.data!;
        emit(ProvidersSearchLoaded());
      },
    );
  }
}
