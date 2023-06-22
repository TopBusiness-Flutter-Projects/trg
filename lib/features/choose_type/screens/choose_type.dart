import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/custom_button.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/assets_manager.dart';

class ChooseType extends StatefulWidget{
  const ChooseType({Key? key}) : super(key: key);

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140,),
              Image.asset(ImageAssets.loginLogoImage),
              SizedBox(height: 100,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  borderRadius: 16,
                    text: "مقدم خدمة",
                    color: AppColors.primary,
                    onClick: (){
                      _getStoreUser();
                }),
              ),
              const SizedBox(height: 42,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                    borderRadius: 16,
                    text: "عميل",
                    color: AppColors.primary,
                    onClick: (){
                      Navigator.pushNamedAndRemoveUntil(context, Routes.homePageScreenRoute,
                        ModalRoute.withName(
                        Routes.initialRoute,
                      ),);
                    }),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('user') != null) {

        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.providerhomePageScreenRoute,
          ModalRoute.withName(
            Routes.initialRoute,
          ),
        );

      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginRoute,
          ModalRoute.withName(
            Routes.initialRoute,
          ),
        );
      }
    }
  }


