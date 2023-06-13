import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(80),
        child:
        Directionality(

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

              child:
              // CustomAppBar()
              AppBar(
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
            const SizedBox(height: 118,),
            Text(
              "new_password",
              style: TextStyle(
                  color: AppColors.orangeThirdPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ).tr(),
            const SizedBox(height: 58,),
            CustomTextField(
                title: translate.tr("enter_new_password"),
                textInputType: TextInputType.text,
                prefixWidget: Icon(Icons.lock_outline),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
               const SizedBox(height: 25,),
              CustomTextField(
                title: translate.tr("confirm_password"),
                textInputType: TextInputType.text,
                prefixWidget: Icon(Icons.lock_outline),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 72,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                  borderRadius: 16,
                  text: translate.tr("save"),
                  color: AppColors.primary,
                  onClick: (){}),
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
