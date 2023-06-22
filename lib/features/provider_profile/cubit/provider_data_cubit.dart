import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trj/core/preferences/preferences.dart';

import '../../../core/model/user_model.dart';

part 'provider_data_state.dart';

class ProviderDataCubit extends Cubit<ProviderDataState> {
  UserModel? userModel;
  ProviderDataCubit() : super(ProviderDataInitial()){
    getUserData();
  }

  Future<void> getUserData() async {
    userModel=await Preferences.instance.getUserModel();
    emit(ProviderUserData());
  }
}
