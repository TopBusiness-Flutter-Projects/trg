import 'package:easy_localization/easy_localization.dart' as translate;

import 'package:flutter/material.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/custom_textfield.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(80),
        child: Directionality(

          textDirection:
          translate.EasyLocalization.of(context)!.locale.languageCode=='ar'?
          TextDirection.ltr: TextDirection.rtl ,
          child: Container(

            padding:  EdgeInsets.only(top: 10,bottom: 10),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(16))),
              child: Center(

                child: AppBar(

                  actions: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(ImageAssets.logoImage),
                    )
                  ],
                ),
              ),
           ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            SizedBox(
                width: 145,
                height: 145,
                child: Image.asset(ImageAssets.loginLogoImage)),
            const SizedBox(height: 70,),
            Text(
              "login",
              style: TextStyle(
                  color: AppColors.orangeThirdPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ).tr(),
            const SizedBox(height: 25,),
            CustomTextField(
                title: translate.tr("email"),
                textInputType: TextInputType.emailAddress,
                prefixWidget: Icon(Icons.email_outlined),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 25,),
            CustomTextField(
                title: translate.tr("password"),
                textInputType: TextInputType.text,
                prefixWidget: Icon(Icons.lock_outline),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                  borderRadius: 16,
                  text: translate.tr("log"),
                  color: AppColors.primary,
                  onClick: (){}),
            ),
            const SizedBox(height: 13,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("new_login",style: TextStyle(color: AppColors.orangeThirdPrimary),).tr(),
                  Text("forgot_password",style: TextStyle(color: AppColors.orangeThirdPrimary)).tr(),

              ],),

            ),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
