import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/widgets/curved_app_bar.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:trj/features/sign_up/cubit/register_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../widgets/cities.dart';
import '../widgets/services_type.dart';
import '../widgets/translation_language.dart';

enum ServiceProvider { office, individual, writer, VerbalEditing }

ServiceProvider selectedServiceProvider = ServiceProvider.office;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = context.read<RegisterCubit>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), child: CurvedAppBar()),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    "new_login",
                    style: TextStyle(
                        color: AppColors.orangeThirdPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ).tr(),
                  Text(
                    "fill_data",
                    style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ).tr(),
                  const SizedBox(
                    height: 28,
                  ),
                  Visibility(
                    visible: cubit.userModel?.data == null ? true : false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(AssetImage(
                                ImageAssets.serviceProviderTypeIcon)),
                            SizedBox(
                              width: 10,
                            ),
                            Text("service_provider_type").tr()
                          ],
                        ),
                        Padding(
                          // padding: const EdgeInsets.symmetric(horizontal: 68.0),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  title: Text("office").tr(),
                                  value: ServiceProvider.office,
                                  groupValue: selectedServiceProvider,
                                  onChanged: (ServiceProvider? value) {
                                    if (value != null) {
                                      cubit.registerModel.providerType = 1;
                                      cubit.registerModel.individualType = 0;

                                      cubit.changeProviderType(value);
                                      // setState(() {
                                      //   selectedServiceProvider = value!;
                                      // });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text("individual").tr(),
                                  value: ServiceProvider.individual,
                                  groupValue: selectedServiceProvider,
                                  onChanged: (value) {
                                    if (value != null) {
                                      cubit.registerModel.providerType = 2;
                                      cubit.registerModel.individualType = 0;

                                      cubit.changeProviderType(value);
                                      print(value.toString());

                                      // setState(() {
                                      //   selectedServiceProvider = value!;
                                      // });
                                    }
                                  },
                                ),
                              )
                              // Radio(
                              //   toggleable: true,
                              //     splashRadius: 20,
                              //     activeColor: Colors.black,
                              //     value: serviceProvider.office,
                              //     groupValue: serviceProvider,
                              //     onChanged: (value){}),
                              // Radio(value: serviceProvider.individual,
                              //     groupValue: serviceProvider,
                              //     onChanged: (value){}),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  title: Text("content_writer").tr(),
                                  value: ServiceProvider.writer,
                                  groupValue: selectedServiceProvider,
                                  onChanged: (ServiceProvider? value) {
                                    print(value);
                                    if (value != null) {
                                      cubit.registerModel.individualType = 2;
                                      cubit.registerModel.providerType = 3;

                                      cubit.changeServiceProviderType(value);
                                      // setState(() {
                                      // //   selectedServiceProvider = value!;
                                      //  });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text("lang_edit").tr(),
                                  value: ServiceProvider.VerbalEditing,
                                  groupValue: selectedServiceProvider,
                                  onChanged: (ServiceProvider? value) {
                                    print(value);
                                    if (value != null) {
                                      cubit.registerModel.individualType = 1;
                                      cubit.registerModel.providerType = 4;

                                      cubit.changeServiceProviderType(value);
                                      print(value.toString());
                                    }
                                  },
                                ),
                              )
                              // Radio(
                              //   toggleable: true,
                              //     splashRadius: 20,
                              //     activeColor: Colors.black,
                              //     value: serviceProvider.office,
                              //     groupValue: serviceProvider,
                              //     onChanged: (value){}),
                              // Radio(value: serviceProvider.individual,
                              //     groupValue: serviceProvider,
                              //     onChanged: (value){}),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cubit.nameControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.name = data;
                        cubit.checkValidLoginData();
                      },
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon:
                              ImageIcon(AssetImage(ImageAssets.profileIcon)),
                          hintText: 'user_name'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      obscureText: true,
                      cursorColor: AppColors.primary,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: cubit.passwordControl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      onChanged: (data) {
                        cubit.registerModel.password = data;
                        formKey.currentState!.validate();
                        cubit.checkValidLoginData();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          hintText: 'password'.tr(),
                          hintStyle:
                              TextStyle(color: AppColors.gray1, fontSize: 14.0),
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.changeHidden();
                            },
                            child: cubit.isHidden
                                ? Icon(
                                    Icons.visibility,
                                  )
                                : Icon(Icons.visibility_off),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.email = data;
                        cubit.checkValidLoginData();
                      },
                      controller: cubit.emailControl,
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon: Icon(Icons.mail_outline_sharp),
                          hintText: 'email'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Visibility(
                    visible:
                        selectedServiceProvider == ServiceProvider.office ||
                                selectedServiceProvider ==
                                    ServiceProvider.individual
                            ? true
                            : false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ServicesType(),
                    ),
                  ),
                  Visibility(
                    visible:
                    selectedServiceProvider == ServiceProvider.office ||
                        selectedServiceProvider ==
                            ServiceProvider.individual
                        ? true
                        : false,
                    child: const SizedBox(
                      height: 26,
                    ),
                  ),

                  Visibility(
                    visible:
                        selectedServiceProvider == ServiceProvider.office ||
                                selectedServiceProvider ==
                                    ServiceProvider.individual
                            ? true
                            : false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TranslationLanguages(),
                    ),
                  ),
                  Visibility(
                    visible:
                    selectedServiceProvider == ServiceProvider.office ||
                        selectedServiceProvider ==
                            ServiceProvider.individual
                        ? true
                        : false,
                    child: const SizedBox(
                      height: 26,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Cities(),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: cubit.phoneControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.phone = data;
                        cubit.checkValidLoginData();
                      },
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'phone'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cubit.experienceControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.experienceYears = data;
                        cubit.checkValidLoginData();
                      },
                      // controller: cubit.emailControl,
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon:
                              Image.asset(ImageAssets.yearsExperienceIcon),
                          hintText: 'no_years_experience'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cubit.addressControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.address = data;
                        cubit.checkValidLoginData();
                      },
                      // controller: cubit.emailControl,
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon: Icon(Icons.pin_drop),
                          hintText: 'address'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 6,
                      autofocus: false,
                      minLines: 4,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cubit.previousexperienceControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.previousExperience = data;
                        cubit.checkValidLoginData();
                      },
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 55.0),
                            child: ImageIcon(
                                AssetImage(ImageAssets.experienceIcon)),
                          ),
                          hintText: 'prev_experience'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      maxLines: 6,
                      autofocus: false,
                      minLines: 4,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cubit.aboutmeControl,
                      onChanged: (data) {
                        formKey.currentState!.validate();
                        cubit.registerModel.aboutMe = data;
                        cubit.checkValidLoginData();
                      },
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'field_reguired'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 55.0),
                            child: ImageIcon(
                                AssetImage(ImageAssets.experienceIcon)),
                          ),
                          hintText: 'aboutMe'.tr(),
                          hintStyle: TextStyle(
                              color: AppColors.gray1, fontSize: 14.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: cubit.userModel?.data == null ? true : false,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Visibility(
                                visible: selectedServiceProvider ==
                                    ServiceProvider.individual ||
                                    selectedServiceProvider ==
                                        ServiceProvider.VerbalEditing ||
                                    selectedServiceProvider ==
                                        ServiceProvider.writer
                                    ? true
                                    : false,
                                child: InkWell(
                                  onTap: () {
                                    buildAlertDialog("3");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Color(0xf007EFF),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Image.asset(ImageAssets.attatchIcon),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "attachCertificate".tr(),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Visibility(
                              visible: selectedServiceProvider ==
                                  ServiceProvider.individual
                                  ? true
                                  : false,
                              child: cubit.registerModel.experience_photo_path
                                  .isEmpty
                                  ? Container()
                                  : Image.file(
                                File(
                                  cubit.registerModel
                                      .experience_photo_path,
                                ),
                                width: 140.0,
                                height: 140.0,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Visibility(
                                visible: selectedServiceProvider ==
                                    ServiceProvider.office
                                    ? true
                                    : false,
                                child: InkWell(
                                  onTap: () {
                                    buildAlertDialog("1");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Color(0xf007EFF),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Image.asset(ImageAssets.attatchIcon),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("attachPicActualSite").tr(),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Visibility(
                              visible: selectedServiceProvider ==
                                  ServiceProvider.office
                                  ? true
                                  : false,
                              child: cubit
                                  .registerModel.location_photo_path.isEmpty
                                  ? Container()
                                  : Image.file(
                                File(
                                  cubit.registerModel.location_photo_path,
                                ),
                                width: 140.0,
                                height: 140.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Visibility(
                                visible: selectedServiceProvider ==
                                    ServiceProvider.office
                                    ? true
                                    : false,
                                child: InkWell(
                                  onTap: () {
                                    buildAlertDialog("2");
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Color(0xf007EFF),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Image.asset(ImageAssets.attatchIcon),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("attachCommercial").tr(),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Visibility(
                              visible: selectedServiceProvider ==
                                  ServiceProvider.office
                                  ? true
                                  : false,
                              child: cubit.registerModel.commericial_photo_path
                                  .isEmpty
                                  ? Container()
                                  : Image.file(
                                File(
                                  cubit.registerModel
                                      .commericial_photo_path,
                                ),
                                width: 140.0,
                                height: 140.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CustomButton(
                        text: "submit".tr(),
                        color: AppColors.primary,
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userModel!.data == null
                                ? cubit.register(context)
                                : cubit.update(context);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildAlertDialog(String type) {
    return showDialog(
        context: context,
        builder: (c) {
          return BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'choose_photo'.tr(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.gray4,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<RegisterCubit>()
                            .pickImage(type: 'camera', type1: type);
                      },
                      child: Text(
                        'camera'.tr(),
                        style:
                            TextStyle(fontSize: 18.0, color: AppColors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<RegisterCubit>()
                            .pickImage(type: 'gallery', type1: type);
                      },
                      child: Text(
                        'gallery'.tr(),
                        style:
                            TextStyle(fontSize: 18.0, color: AppColors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.gray4,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'cancel'.tr(),
                        style:
                            TextStyle(fontSize: 18.0, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
