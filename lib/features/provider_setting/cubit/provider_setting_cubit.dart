import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trj/core/preferences/preferences.dart';

import '../../../core/model/user_model.dart';

part 'provider_setting_state.dart';

class ProviderSettingCubit extends Cubit<ProviderSettingState> {
  UserModel? userModel;
  ProviderSettingCubit() : super(ProviderSettingInitial()){
    getUserSetting();
  }

  Future<void> getUserSetting() async {
    userModel=await Preferences.instance.getUserModel();
    emit(ProviderUserSetting());
  }
}
