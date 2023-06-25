import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:trj/core/utils/assets_manager.dart';
import 'package:restart_app/restart_app.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/restart_app_class.dart';
import '../../../core/widgets/network_image.dart';
import '../cubit/navigation_cubit.dart';

class MenuScreenWidget extends StatefulWidget {
  const MenuScreenWidget({Key? key, required this.closeClick})
      : super(key: key);

  final VoidCallback closeClick;

  @override
  State<MenuScreenWidget> createState() => _MenuScreenWidgetState();
}

class _MenuScreenWidgetState extends State<MenuScreenWidget> {
  PackageInfo? packageInfo;

  final InAppReview inAppReview = InAppReview.instance;

  @override
  void initState() {
    super.initState();
    setuppackage();
  }

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: lang == 'en' ? Radius.circular(60) : Radius.zero,
        bottomLeft: lang == 'ar' ? Radius.circular(60) : Radius.zero,
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.primary,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  ImageAssets.logoImage,
                                  width: 100,
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: lang == 'ar'
                                        ? Radius.circular(16)
                                        : Radius.zero,
                                    bottomLeft: lang == 'ar'
                                        ? Radius.circular(16)
                                        : Radius.zero,
                                    bottomRight: lang == 'en'
                                        ? Radius.circular(16)
                                        : Radius.zero,
                                    topRight: lang == 'en'
                                        ? Radius.circular(16)
                                        : Radius.zero),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      ImageAssets.languageImage,
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      ImageAssets.shareImage,
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      ImageAssets.rateImage,
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      ImageAssets.callImage,
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Preferences().getSavedLang().then(
                                          (value) {
                                            value = lang == 'ar' ? 'en' : 'ar';
                                            Preferences().savedLang(value);
                                            lang == 'ar'
                                                ? EasyLocalization.of(context)!
                                                    .setLocale(
                                                        const Locale('en'))
                                                : EasyLocalization.of(context)!
                                                    .setLocale(
                                                        const Locale('ar'));
                                          },
                                        );
                                        Phoenix.rebirth(context);
                                        //   Future.delayed(Duration(seconds: 4)).then((value) => {Navigator.pushReplacementNamed(context, Routes.initialRoute)});
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'language'.tr(),
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                              width: lang == 'ar' ? 150 : 100),
                                          Text(
                                            lang == 'ar' ? 'ع' : 'En',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 13),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      shareApp();
                                    },
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        'share'.tr(),
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      rateApp();
                                    },
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        'rate'.tr(),
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.contactus);
                                    },
                                    child: Text(
                                      'contact_us'.tr(),
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //   child: Row(
                  //     // mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         ImageAssets.linkedindImage,
                  //         width: 40.0,
                  //         height: 40.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       Image.asset(
                  //         ImageAssets.twitterImage,
                  //         width: 40.0,
                  //         height: 40.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       Image.asset(
                  //         ImageAssets.instagramImage,
                  //         width: 40.0,
                  //         height: 40.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       Image.asset(
                  //         ImageAssets.facebookImage,
                  //         width: 40.0,
                  //         height: 40.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7,
            right: lang == 'en' ? -40 : null,
            left: lang == 'ar' ? -40 : null,
            child: Container(
              width: 130,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: widget.closeClick,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Transform.rotate(
                          angle: lang == 'en' ? (3.14) : 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColors.orangeThirdPrimary,
                            ),
                            child: Center(
                              child: Transform.rotate(
                                angle: lang == 'ar' ? (3.14) : 0,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void shareApp() async {
    String url = '';
    String packgename = packageInfo!.packageName;

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
    packageInfo = await PackageInfo.fromPlatform();
  }
}
