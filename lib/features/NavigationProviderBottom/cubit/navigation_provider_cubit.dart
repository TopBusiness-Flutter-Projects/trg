import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../config/routes/app_routes.dart';

import '../../../core/preferences/preferences.dart';
import '../../../core/remote/service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/show_dialog.dart';
import '../../../core/utils/toast_message_method.dart';

part 'navigation_provider_state.dart';

class NavigationProviderCubit extends Cubit<NavigationProviderState> {
  int index=0;

  NavigationProviderCubit() : super(NavigationProviderInitial()){

  }

  void updateIndex(int index){
    this.index = index;
    emit(MainPageIndexUpdated(index));
  }

}
