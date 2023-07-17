import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:trj/features/home/cubit/home_cubit.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/assets_manager.dart';

class ChooseTranslationType extends StatefulWidget{
  const ChooseTranslationType({Key? key}) : super(key: key);

  @override
  State<ChooseTranslationType> createState() => _ChooseTranslationTypeState();
}

class _ChooseTranslationTypeState extends State<ChooseTranslationType> {
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
                    text: "office".tr(),
                    color: AppColors.primary,
                    onClick: (){
                      context.read<HomeCubit>().setserviceType(1,"office".tr(),null,null);

//                      context.read<HomeCubit>().changeCity(null);
                      Navigator.pushNamed(context, Routes.homePageScreenRoute);
                }),
              ),
              const SizedBox(height: 42,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                    borderRadius: 16,
                    text: "individual".tr(),
                    color: AppColors.primary,
                    onClick: (){
                      context.read<HomeCubit>().setserviceType(1,"individual".tr(),null,null);

                    //  context.read<HomeCubit>().changeCity(null);

                      Navigator.pushNamed(context, Routes.homePageScreenRoute,
                     );
                    }),
              ),

              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }



  }


