import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/config/routes/app_routes.dart';
import 'package:trj/core/widgets/show_loading_indicator.dart';
import 'package:trj/features/provider_profile/cubit/provider_data_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_network_image.dart';

class ProviderProfile extends StatelessWidget {
  const ProviderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderDataCubit cubit = context.read<ProviderDataCubit>();
    return BlocBuilder<ProviderDataCubit, ProviderDataState>(
      builder: (context, state) {
        if(state is ProviderUserData){
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
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, Routes.signUpScreenRoute);
                                          },
                                            child: Icon(Icons.edit)),
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
                            ),
                          )),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "city".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.city,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "address".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.address,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "provider".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.provider_type == 1
                          ? 'office'
                          : "individual",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "experience".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.experience,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "phone".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.phone,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "email".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.email,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "previous_work".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.previousExperience,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "whats_app".tr() + ":",
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      cubit.userModel!.data!.user.watts,
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  cubit.userModel!.data!.user.aboutMe,
                  style: TextStyle(
                      fontSize: 14, color: AppColors.orangeThirdPrimary),
                ),
                Text(
                  'follow_us'.tr(),
                  style: TextStyle(
                      fontSize: 14, color: AppColors.gray8),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.linkedindImage,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                        color: AppColors.primary,
                      ),
                      Image.asset(
                        ImageAssets.twitterImage,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                        color: AppColors.primary,
                      ),
                      Image.asset(
                        ImageAssets.instagramImage,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                        color: AppColors.primary,
                      ),

                      Image.asset(
                        ImageAssets.facebookImage,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                        color: AppColors.primary,
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,)
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
}
