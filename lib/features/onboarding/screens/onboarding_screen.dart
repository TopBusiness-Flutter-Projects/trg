import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trj/core/widgets/custom_button.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/no_data_widget.dart';
import '../../../core/widgets/show_loading_indicator.dart';

import '../cubit/on_boarding_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;



  @override
  void initState() {
    super.initState();
    context.read<OnBoardingCubit>().getOnBoardingData();

  }

  Future<void> onDonePress() async {
    //log("End of slides");
    Preferences.instance.setFirstInstall();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('user') != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.homePageScreenRoute,
        ModalRoute.withName(
          Routes.initialRoute,
        ),
      );
    }
    else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.chooseTypeRoute,
        ModalRoute.withName(
          Routes.initialRoute,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {

          OnBoardingCubit cubit = context.read<OnBoardingCubit>();
          _currentIndex=cubit.index;
          if (state is OnBoardingLoading) {
            return ShowLoadingIndicator();
          }

          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondPrimary])),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    children: cubit.listContentConfig,
                    onPageChanged: (value) {
                      print(value);
                      if(value!=_currentIndex) {
                        cubit.updateindex(_currentIndex);
                      }
                    },
                    controller: cubit.pagecontrol,
                  ),
                ),
                Container(
                    height: 20,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          cubit.listContentConfig.length,
                          (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              margin: EdgeInsets.only(right: 4),
                              height: 5,
                              width:  5,
                              // current indicator is wider
                              decoration: BoxDecoration(
                                  color: _currentIndex==index ?AppColors.orangeThirdPrimary:AppColors.white,
                                  borderRadius: BorderRadius.circular(3)))),
                    )),
                CustomButton(
                  borderRadius: 16,
                  paddingHorizontal: 150,
                  text:_currentIndex<cubit.listContentConfig.length-1? "next".tr():"end".tr(),
                  color: AppColors.orangeThirdPrimary,
                  onClick: () {
                    if(_currentIndex==cubit.listContentConfig.length-1){
                    onDonePress();
                    }
                    else{
                    cubit.updateindex(_currentIndex);
                  }},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                  child: InkWell(
                    onTap: () {
                      onDonePress();
                    },
                    child: Text(
                      "skip".tr(),
                      style: TextStyle(
                          fontSize: 12, color: AppColors.orangeThirdPrimary),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
