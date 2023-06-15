import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/assets_manager.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/restart_app_class.dart';
import '../../../core/widgets/network_image.dart';
import '../cubit/navigation_cubit.dart';

class MenuScreenWidget extends StatelessWidget {
  const MenuScreenWidget({Key? key, required this.closeClick})
      : super(key: key);

  final VoidCallback closeClick;

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
                  BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      NavigationCubit cubit = context.read<NavigationCubit>();
                   return  Center(

                            );


                    },
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      children: [


                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Container(
                            width: 20,
                            height: 2,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            color: AppColors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.facebookImage,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                ImageAssets.twitterImage,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                ImageAssets.instagramImage,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                ImageAssets.websiteImage,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                ImageAssets.youtubeImage,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
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
                    onTap: closeClick,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: AppColors.orangeThirdPrimary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
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
}
