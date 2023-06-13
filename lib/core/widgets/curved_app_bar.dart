import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';
class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(

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
    );
  }
}
