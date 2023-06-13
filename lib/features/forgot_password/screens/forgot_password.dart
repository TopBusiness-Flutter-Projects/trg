import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/curved_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(80),
        child:CurvedAppBar()
    ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 118,),

            Text(
              "password_recovery",
              style: TextStyle(
                  color: AppColors.orangeThirdPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ).tr(),
            Text(
              "you_are_safe",
              style: TextStyle(
               color: AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ).tr(),
            const SizedBox(height: 99,),
            CustomTextField(
                title: translate.tr("email"),
                textInputType: TextInputType.emailAddress,
                prefixWidget: Icon(Icons.email_outlined),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 72,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                  borderRadius: 16,
                  text: translate.tr("recovery"),
                  color: AppColors.primary,
                  onClick: (){
                    Navigator.pushNamed(context, Routes.codeVerifyScreenRoute);
                  }),
            ),
            const SizedBox(height: 13,),


          ],
        ),
      ),
    );
  }
}
