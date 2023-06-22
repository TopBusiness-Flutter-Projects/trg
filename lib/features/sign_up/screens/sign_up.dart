import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/widgets/curved_app_bar.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:trj/features/sign_up/cubit/register_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../widgets/cities.dart';
import '../widgets/city_drop_down.dart';
import '../widgets/services_type.dart';
enum serviceProvider { office, individual }
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit=context.read<RegisterCubit>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child:CurvedAppBar()
      ),
      body: BlocBuilder<RegisterCubit, RegisterState>(
  builder: (context, state) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 36,),
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
              const SizedBox(height: 28,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
          TextFormField(
            maxLines: 1,
            autofocus: false,
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onChanged: (data) {
              formKey.currentState!.validate();
              cubit.registerModel.name = data;
              cubit.checkValidLoginData();
            },
            validator: (value) {
              print(value);
              if (value == null || value.isEmpty){
                return 'field_reguired'.tr();
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                prefixIcon: ImageIcon(AssetImage(ImageAssets.profileIcon)),
                hintText: 'user_name'.tr(),
                hintStyle:  TextStyle(
                    color: AppColors.gray1,
                    fontSize: 14.0)),
          ),
        ),
              const SizedBox(height: 26,),
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
                    if (value == null || value.isEmpty){
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
                      hintStyle:  TextStyle(
                          color: AppColors.gray1,
                          fontSize: 14.0),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          cubit.changeHidden();
                        },
                        child: cubit.isHidden
                            ?  Icon(
                          Icons.visibility,
                        )
                            :  Icon(Icons.visibility_off),
                      )),
                ),
              ),
              const SizedBox(height: 26,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child:
                TextFormField(
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
                    if (value == null || value.isEmpty){
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
                      hintStyle:  TextStyle(
                          color: AppColors.gray1,
                          fontSize: 14.0)),
                ),
              ),
              const SizedBox(height: 26,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: ServicesType(),
              ),
              const SizedBox(height: 26,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child:
                Cities(),
              ),
              const SizedBox(height: 26,),
              CustomTextField(
                  title: translate.tr("phone_number"),
                  textInputType: TextInputType.name,
                  prefixWidget: Icon(Icons.local_phone_outlined),
                  borderSide: BorderSide(color: AppColors.primary),
                  backgroundColor: AppColors.white),
              const SizedBox(height: 26,),
              CustomTextField(
              title: translate.tr("prev_experience"),
              textInputType: TextInputType.name,
            prefixWidget: Padding(
              padding: const EdgeInsets.only(bottom: 70.0,left: 10,right: 10),
              child: Image.asset(ImageAssets.experienceIcon),
            ),
              borderSide: BorderSide(color: AppColors.primary),
              backgroundColor: AppColors.white,
            minLine: 5,
          ),
              const SizedBox(height: 26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ImageIcon(AssetImage(ImageAssets.serviceProviderTypeIcon)),
                SizedBox(width: 10,),
                Text("service_provider_type").tr()
              ],),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 68.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text("office").tr(),
                        value: "office",
                        groupValue: serviceProvider,
                        onChanged: (value){
                          cubit.changeProviderType(value.toString());
                          // setState(() {
                          //   gender = value.toString();
                          // });
                        },
                      ),
                    ),
                   Expanded(
                     child:  RadioListTile(
                     title: Text("individual").tr(),
                     value: "individual",
                     groupValue: serviceProvider,
                     onChanged: (value){
                       cubit.changeProviderType(value.toString());

                       // setState(() {
                       //   gender = value.toString();
                       // });
                     },
                   ),)
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
              SizedBox(height: 44,),
              Visibility(
                  visible: cubit.selectedProviderType == 'individual'.tr()
                      ? true
                      : false,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: Text("office").tr(),
                            value: cubit.selectedServiceType,
                            groupValue: serviceProvider,

                            onChanged: (value){
                              cubit.changeProviderType(value.toString());
                              // setState(() {
                              //   gender = value.toString();
                              // });
                            },
                          ),
                        ),
                        Expanded(
                          child:  RadioListTile(
                            title: Text("individual").tr(),
                            value: cubit.selectedServiceType,
                            groupValue: serviceProvider,
                            onChanged: (value){
                              cubit.changeProviderType(value.toString());

                              // setState(() {
                              //   gender = value.toString();
                              // });
                            },
                          ),)
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
                  ),),
              SizedBox(height: 44,),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(text: "submit".tr(), color: AppColors.primary, onClick: (){}),
              ),
              SizedBox(height: 20,)


            ],
          ),
        ),
    );
  },
),
    );
  }
}
