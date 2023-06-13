import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
class CodeVerify extends StatelessWidget {
  const CodeVerify({Key? key}) : super(key: key);

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
            const SizedBox(height: 42,),

            Text(
              "please_enter_code",
              style: TextStyle(
                  color: AppColors.orangeThirdPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ).tr(),
            Text(
              "confirmation_code",
              style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ).tr(),
            const SizedBox(height: 59,),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width*0.5,
              fieldWidth: 40,
              style: TextStyle(
                  fontSize: 32,
                color: AppColors.gray
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            const SizedBox(height: 68,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                  borderRadius: 16,
                  text: translate.tr("submit"),
                  color: AppColors.primary,
                  onClick: (){
                   // Navigator.pushNamed(context, Routes.codeVerifyScreenRoute);
                  }),
            ),
            const SizedBox(height: 13,),


          ],
        ),
      ),
    );
  }
}
