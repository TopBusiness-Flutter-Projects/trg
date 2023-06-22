import 'package:easy_localization/easy_localization.dart' as translate;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/curved_app_bar.dart';
import 'package:trj/core/widgets/custom_textfield.dart';
import 'package:trj/features/login/cubit/login_cubit.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/assets_manager.dart';

import '../../../core/widgets/custom_button.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit=context.read<LoginCubit>();
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return Form(
      key: formKey,
      child: Scaffold(

        appBar: PreferredSize(

          preferredSize:  Size.fromHeight(80),
          child:CurvedAppBar(),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: 40,),
              SizedBox(
                  width: 145,
                  height: 145,
                  child: Image.asset(ImageAssets.loginLogoImage)),
               SizedBox(height: 70,),
              Text(
                "login",
                style: TextStyle(
                    color: AppColors.orangeThirdPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ).tr(),
               SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.primary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (data) {
                    formKey.currentState!.validate();
                    cubit.loginModel.email = data;
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
               SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    cubit.loginModel.password = data;
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
               SizedBox(height: 40,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                    borderRadius: 16,
                    text: translate.tr("log"),
                    color: AppColors.primary,
                    onClick: (){
                      cubit.isLoginValid?cubit.login(context):null;
                    }),
              ),
               SizedBox(height: 13,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 19.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  InkWell(
                     onTap:(){
                       Navigator.pushNamed(context, Routes.signUpScreenRoute);
                     },
                      child: Text("new_login",style: TextStyle(color: AppColors.orangeThirdPrimary),).tr()),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPasswordScreenRoute);
                      },
                        child: Text("forgot_password",style: TextStyle(color: AppColors.orangeThirdPrimary)).tr()),

                ],),

              ),
              SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
