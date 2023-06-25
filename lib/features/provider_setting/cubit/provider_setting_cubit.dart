import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trj/config/routes/app_routes.dart';
import 'package:trj/core/preferences/preferences.dart';
import 'package:trj/features/splash/presentation/screens/splash_screen.dart';

import '../../../core/model/user_model.dart';
import '../../../core/remote/service.dart';

part 'provider_setting_state.dart';

class ProviderSettingCubit extends Cubit<ProviderSettingState> {
  UserModel? userModel;

  ProviderSettingCubit(this.api) : super(ProviderSettingInitial()) {
    getUserSetting();
  }

  final ServiceApi api;

  Future<void> getUserSetting() async {
    userModel = await Preferences.instance.getUserModel();
    emit(ProviderUserSetting());
  }

  deleteAccount(BuildContext context) async {
    final response = await api.deleteAccount();
    response.fold(

          (l) => emit(DeleteUserFailure()),
          (r) {
        Preferences.instance.clearUserData().then((value) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.chooseTypeRoute,(route) {
            return true;
          },);
        });

        emit(DeleteUserSuccessfully());
      },


    );
  }
}