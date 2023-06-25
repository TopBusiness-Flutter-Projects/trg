import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:restart_app/restart_app.dart';
import 'package:trj/core/widgets/show_loading_indicator.dart';
import 'package:trj/features/provider_profile/cubit/provider_data_cubit.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_network_image.dart';
import '../cubit/provider_setting_cubit.dart';

class ProviderSetting extends StatefulWidget {
  const ProviderSetting({Key? key}) : super(key: key);

  @override
  State<ProviderSetting> createState() => _ProviderSettingState();
}

class _ProviderSettingState extends State<ProviderSetting> {
  PackageInfo? packageInfo ;

  final InAppReview inAppReview = InAppReview.instance;
  @override
  void initState() {
    super.initState();
    setuppackage();
  }
  @override
  Widget build(BuildContext context) {
    ProviderSettingCubit cubit = context.read<ProviderSettingCubit>();
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return BlocBuilder<ProviderSettingCubit, ProviderSettingState>(
      builder: (context, state) {
        // if(state is DeleteUserSuccessfully){
        //   Navigator.pushNamed(context, Routes.chooseTypeRoute);
        // }
        if(state is ProviderUserSetting){
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,

                          child: Container(height: 300,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16))
                            ),

                          )),
                      Positioned(

                          bottom: 0,
                          left: 0,
                          right: 0,

                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width -100,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: ManageCircleNetworkImage(
                                          imageUrl:
                                              cubit.userModel!.data!.user.image,
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      SizedBox(height: 50,),
                                      Text(
                                        cubit.userModel!.data!.user.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Material(
                   elevation: 10,
                   color: AppColors.white,
                   borderRadius: BorderRadius.all(Radius.circular(16)),
                   child: Container(
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               SizedBox(height: 20,),
                               InkWell(
                                 onTap: () {

                                   Preferences().getSavedLang().then(
                                         (value) {
                                       value = lang == 'ar' ? 'en' : 'ar';
                                       Preferences().savedLang(value);
                                       lang == 'ar'
                                           ? EasyLocalization.of(context)!.setLocale(
                                           const Locale('en'))
                                           : EasyLocalization.of(context)!.setLocale(
                                           const Locale('ar'));
                                     },
                                   );
                                   Phoenix.rebirth(context);                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.languageImage,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Text('language'.tr(),
                                       style: TextStyle(color: AppColors.primary,fontSize: 13),),
                                     Expanded(child: Container()),
                                     Text(lang=='ar'?'ع':'En',
                                       style: TextStyle(color: AppColors.primary,fontSize: 13),),
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Divider(
                                 height: 2,
                                 color: AppColors.unselectedTab,
                               ),
                               SizedBox(height: 20,),
                               InkWell(
                                 onTap: () {
                                   shareApp();
                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.shareImage,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Container(

                                       child: Text('share'.tr(),
                                         style: TextStyle(color: AppColors.primary,fontSize: 13),),
                                     )
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Divider(
                                 height: 2,
                                 color: AppColors.unselectedTab,
                               ),
                               SizedBox(height: 20,),
                               InkWell(
                                 onTap: () {

                                   rateApp();
                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.rateImage,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Container(

                                       child: Text('rate'.tr(),
                                         style: TextStyle(color: AppColors.primary,fontSize: 13),),
                                     )
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Divider(
                                 height: 2,
                                 color: AppColors.unselectedTab,
                               ),
                               SizedBox(height: 20,),

                               InkWell(
                                 onTap: () {

                                   Navigator.pushNamed(context, Routes.contactus);
                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.callImage,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Text('contact_us'.tr(),
                                       style: TextStyle(color: AppColors.primary,fontSize: 13),)
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Divider(
                                 height: 2,
                                 color: AppColors.unselectedTab,
                               ),
                               SizedBox(height: 20,),
                               //TODO-->LOG OUT
                               InkWell(
                                 onTap: () {
                                   // Preferences.instance.clearUserData();
                                   // Navigator.pushNamed(context, Routes.chooseTypeRoute);
                                   showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return Container(
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10),
                                             border: Border.all(color: Colors.orange,width: 2)
                                         ),
                                         child: AlertDialog(
                                           // title: Text('Dialog Title'),
                                           content: Text('wanna_logout'.tr(),
                                             textAlign: TextAlign.center,
                                             style: TextStyle(color: Colors.orange),
                                           ),
                                           actions: <Widget>[

                                             SizedBox(
                                               width:125,
                                               child: ElevatedButton(
                                                 child: Text('cancel'.tr()),
                                                 onPressed: () {
                                                   Navigator.of(context).pop();
                                                 },
                                                 style: ElevatedButton.styleFrom(
                                                     backgroundColor: Colors.red
                                                 ),
                                               ),
                                             ),


                                             SizedBox(
                                               width:125,
                                               child: ElevatedButton(
                                                 child: Text('ok'.tr()),
                                                 onPressed: () async {
                                                   // Do something when the user presses the OK button
                                                   Preferences.instance.clearUserData();
                                                    Navigator.pushNamed(context, Routes.chooseTypeRoute);

                                                 },
                                                 style: ElevatedButton.styleFrom(
                                                     backgroundColor: Colors.green
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       );
                                     },
                                   );
                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.logoutIcon,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Text('logout'.tr(),
                                       style: TextStyle(color: AppColors.primary,fontSize: 13),)
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Divider(
                                 height: 2,
                                 color: AppColors.unselectedTab,
                               ),
                               SizedBox(height: 20,),
                               //TODO-->DELETE
                               InkWell(
                                 onTap: () {
                                   //todo show dialog
                                   showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           border: Border.all(color: Colors.orange,width: 2)
                                         ),
                                         child: AlertDialog(
                                          // title: Text('Dialog Title'),
                                           content: Text('delete_your_account'.tr(),
                                             textAlign: TextAlign.center,
                                             style: TextStyle(color: Colors.orange),
                                           ),
                                           actions: <Widget>[

                                                SizedBox(
                                                  width:125,
                                                  child: ElevatedButton(
                                                   child: Text('cancel'.tr()),
                                                   onPressed: () {
                                                     Navigator.of(context).pop();
                                                   },
                                                   style: ElevatedButton.styleFrom(
                                                     backgroundColor: Colors.red
                                                   ),
                                               ),
                                                ),


                                                 SizedBox(
                                                   width:125,
                                                   child: ElevatedButton(
                                                     child: Text('ok'.tr()),
                                                     onPressed: () async {
                                                   // Do something when the user presses the OK button
                                                   await cubit.deleteAccount(context);

                                               },
                                               style: ElevatedButton.styleFrom(
                                                     backgroundColor: Colors.green
                                               ),
                                             ),
                                                 ),
                                           ],
                                         ),
                                       );
                                     },
                                   );

                                 },
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       ImageAssets.deleteIcon,
                                       width: 20.0,
                                       height: 20.0,
                                       fit: BoxFit.cover,
                                       color: AppColors.primary,
                                     ),
                                     SizedBox(width: 10,),
                                     Text('delete_account'.tr(),
                                       style: TextStyle(color: AppColors.primary,fontSize: 13),)
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20,),

                             ],

                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               )
              ],
            ),
          ),
        );}
        else{
          return ShowLoadingIndicator();
        }

      },
    );
  }

  void shareApp() async {

    String url = '';
    String packgename=packageInfo!.packageName;

    if (Platform.isAndroid) {

      //  print("Dldlldld${packageInfo.packageName}");
      url = "https://play.google.com/store/apps/details?id=${packgename}";
    } else if (Platform.isIOS) {
      url = 'https://apps.apple.com/us/app/${packgename}';
    }
    await FlutterShare.share(title: "Makasp", linkUrl: url);
  }

  Future<void> rateApp() async {

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }

    //
    // RateMyApp rateMyApp = RateMyApp(
    //  preferencesPrefix: 'rateMyApp_',
    //  minDays: 0,
    //  minLaunches: 1,
    //  remindDays: 0,
    //  remindLaunches: 1,
    //
    // );
    //
    // await rateMyApp.init().then((value) async =>
    // {if(rateMyApp.shouldOpenDialog) {
    //  rateMyApp.showRateDialog(
    //
    //   context,
    //   title: 'Rate this app',
    //   message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
    //   rateButton: 'RATE',
    //   noButton: 'NO THANKS',
    //   laterButton: 'MAYBE LATER',
    //  )
    // }
    // else{
    //   should=  (await rateMyApp.isNativeReviewDialogSupported)!,
    //   if(should){
    //    await rateMyApp.launchNativeReviewDialog()}
    //   else{
    //    rateMyApp.launchStore()
    //   }
    //   // print("ddkdkkdkdkjfj")
    //  }});


  }

  Future<void> setuppackage() async {
    packageInfo=   await PackageInfo.fromPlatform();

  }
}
