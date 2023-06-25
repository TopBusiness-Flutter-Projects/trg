import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trj/core/model/user_model.dart';
import 'package:trj/core/preferences/preferences.dart';
import 'package:trj/core/remote/service.dart';

import '../../models/contact_us_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.api) : super(ContactUsInitial()) {
    _getStoreUser();
  }

  final ServiceApi api;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  UserModel? loginModel;

  Future<void> _getStoreUser() async {
    UserModel userModel = await Preferences.instance.getUserModel();
    if (userModel.data!= null) {

      this.loginModel = userModel;
      nameController.text = this.loginModel!.data!.user.name!;
      phoneController.text = this.loginModel!.data!.user.phone!;
      emit(ContactUsGetUserModel());
    }
  }

  contactUsApi() async {
    emit(ContactUsLoading());
    final response = await api.contactUsApi(
      ContactUsData(
        name: nameController.text,
        phone: phoneController.text,
        subject: subjectController.text,
        message: messageController.text,
      ),
    );
    response.fold(
      (l) => emit(ContactUsError()),
      (r) {
        emit(ContactUsLoaded());
        Future.delayed(Duration(seconds: 1),(){
          emit(ContactUsInitial());
        });
      },
    );
  }
}
