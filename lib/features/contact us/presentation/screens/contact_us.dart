import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/utils/toast_message_method.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:trj/core/widgets/show_loading_indicator.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

import '../../../../core/widgets/custom_textfield.dart';
import '../cubit/contact_us_cubit.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          ContactUsCubit cubit = context.read<ContactUsCubit>();
          if (state is ContactUsLoading) {
            return ShowLoadingIndicator();
          } else if (state is ContactUsLoaded) {
            Future.delayed(
              Duration(milliseconds: 300),
              () {
                toastMessage(
                  'Success',
                  context,
                  color: AppColors.success,
                );
                Future.delayed(
                  Duration(milliseconds: 300),
                  () {
                    Navigator.pop(context);
                  },
                );
              },
            );
            return ShowLoadingIndicator();
          }
          return cubit.loginModel != null
              ? Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),),
                          ),
                          width: double.infinity,
                          child: Card(
                            elevation: 8,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)),
                            ),
                            color: AppColors.primary,
                            child: SafeArea(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.logoImage,
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(
                                     'contact_us'.tr(),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: ()=>Navigator.pop(context),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),


                        CustomTextField(
                          controller: cubit.nameController,
                          image: ImageAssets.userIcon,
                          isEnable: false,
                          isBorder: true,
                          backgroundColor: AppColors.transparent,
                          imageColor: AppColors.primary,
                          title: 'name'.tr(),
                          validatorMessage: 'field_required'.tr(),
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: cubit.phoneController,
                          image: ImageAssets.callImage,
                          isEnable: false,
                          isBorder: true,
                          imageColor: AppColors.primary,
                          backgroundColor: AppColors.transparent,
                          title: 'phone'.tr(),
                          validatorMessage:'field_required'.tr(),
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: cubit.subjectController,
                          backgroundColor: AppColors.transparent,
                          image: ImageAssets.subjectIcon,
                          isBorder: true,
                          imageColor: AppColors.primary,
                          title: 'subject'.tr(),
                          validatorMessage: 'field_required'.tr(),
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: cubit.messageController,
                          backgroundColor: AppColors.transparent,
                          image: ImageAssets.writeCommentIcon,
                          isBorder: true,
                          minLine: 5,
                          imageColor: AppColors.primary,
                          title: 'message'.tr(),
                          validatorMessage: 'field_required'.tr(),
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: 'send'.tr(),
                          color: AppColors.primary,
                          onClick: () {
                            if (formKey.currentState!.validate()) {
                              cubit.contactUsApi();
                            }
                          },
                          borderRadius: 35,
                          paddingHorizontal: 60,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                )
              : ShowLoadingIndicator();
        },
      ),
    );
  }
}
