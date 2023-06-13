import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:intro_slider/intro_slider.dart';

import '../../../core/remote/service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/network_image.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  int index=0;

  OnBoardingCubit() : super(OnBoardingInitial()){
    pagecontrol=PageController();
  }


  PageController? pagecontrol;
  List<Widget> listContentConfig = [];

  getOnBoardingData() async {
    emit(OnBoardingLoading());
   listContentConfig.add( Column(
     children: [   Padding(
       padding: EdgeInsets.only(top: 100),
       child: Image.asset(ImageAssets.onboard1Image,height:300,),
     ),
       SizedBox(height: 23,),
       Text(
         "choose_provider".tr(),
         style: TextStyle(
           color: AppColors.white,
           fontWeight: FontWeight.bold,
           fontSize: 20.0,
             decoration: TextDecoration.none

         ),
         textAlign: TextAlign.center,

       ),
       SizedBox(height: 10,),
       Text(
         "you_can_choose_right_service_provider".tr(),
         style: TextStyle(
           color: AppColors.white,
           fontSize: 14.0,
             decoration: TextDecoration.none

         ),
         textAlign: TextAlign.center,
        

       ),],
    ));

    listContentConfig.add( Column(
      children: [   Padding(
        padding: EdgeInsets.only(top: 100),
        child: Image.asset(ImageAssets.onboard2Image,height:300),
      ),
        SizedBox(height: 23,),
        Text(
          "choose_provider".tr(),
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
              decoration: TextDecoration.none
          ),
          textAlign: TextAlign.center,

        ),
        SizedBox(height: 24,),
        Text(
          "you_can_choose_right_service_provider".tr(),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.0,
              decoration: TextDecoration.none
          ),
          textAlign: TextAlign.center,


        ),
      ],
    ));
    listContentConfig.add( Column(
      children: [   Padding(
        padding: EdgeInsets.only(top: 100),
        child: Image.asset(ImageAssets.onboard3Image,height:300),
      ),
        SizedBox(height: 23,),
        Text(
          "choose_provider".tr(),
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            decoration: TextDecoration.none
          ),
          textAlign: TextAlign.center,
      
        ),
        SizedBox(height: 24,),
        Text(
          "you_can_choose_right_service_provider".tr(),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.0,
              decoration: TextDecoration.none
          ),
          textAlign: TextAlign.center,
         
      
        ),],
    ));

    emit(OnBoardingLoaded());
    // final response = await api.onBoardingData();
    // response.fold(
    //   (l) => emit(OnBoardingError()),
    //   (r) {
    //     if (r.code == 250) {
    //       for (final item in r.data!) {
    //
    //       }
    //       emit(OnBoardingLoaded());
    //     } else {
    //       emit(OnBoardingError());
    //     }
    //     // emit(OnBoardingLoaded());
    //   },
    // );
  }

  void updateindex(int currentIndex) {
    print("object");
    print(currentIndex.toString());
    if(currentIndex==listContentConfig.length-1){
      index=0;
    }
    else{
   index=currentIndex+1;}
    pagecontrol!.animateToPage(index, duration: const Duration(milliseconds: 10), curve: Curves.bounceIn);
    emit(OnBoardingLoaded());
  }
}
