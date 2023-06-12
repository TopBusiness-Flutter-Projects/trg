import 'package:flutter/material.dart';
import 'package:trg/core/utils/app_colors.dart';
import 'package:trg/core/widgets/custom_button.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/assets_manager.dart';

class ChooseType extends StatelessWidget{
  const ChooseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.loginLogoImage),
            SizedBox(height: 30,),
            CustomButton(
              borderRadius: 12,
                text: "مقدم خدمة",
                color: AppColors.primary,
                onClick: (){
              Navigator.pushNamed(context, Routes.loginRoute);
            }),
            SizedBox(height: 20,),
            CustomButton(
                borderRadius: 12,
                text: "عميل",
                color: AppColors.primary,
                onClick: (){}),
          ],
        ),
      ),
    );
  }
}
