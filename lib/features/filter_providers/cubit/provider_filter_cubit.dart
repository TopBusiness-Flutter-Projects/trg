import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/model/slider_model.dart';
import '../../../core/remote/service.dart';

part 'provider_filter_state.dart';

class ProviderFilterCubit extends Cubit<ProviderFilterState> {
  ProviderFilterCubit(this.api) : super(ProviderFilterInitial()){

  }
  final ServiceApi api;
  List<ProviderModel> ProvidersList = [];

  getProvidersProviderFilter(int cityId,int serviceTypeId,int providertypeId,String search_key) async {
    emit(ProvidersProviderFilterLoading());
    final response = await api.getProvidersProviderFilter(search_key,providertypeId,cityId,serviceTypeId,0);
    response.fold(
          (l) => emit(ProvidersProviderFilterError()),
          (r) {
        ProvidersList = r.data!;
        emit(ProvidersProviderFilterLoaded());
      },
    );
  }
}
