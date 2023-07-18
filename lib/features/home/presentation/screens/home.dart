import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/features/home/widget/translation_language.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

import '../../cubit/home_cubit.dart';
import '../../widget/cities.dart';
import '../../widget/individual_type.dart';
import '../../widget/providelist.dart';
import '../../widget/provider_type.dart';
import '../../widget/services_type.dart';
import '../../widget/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.providerSearchFilterRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.gray8,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('search'.tr()),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: Cities()),
                    Visibility(
                        visible: cubit.servicetype == 1 ? true : false,
                        child: Expanded(child: ServicesType())),
                  ],
                ),
                Visibility(
                    visible: cubit.servicetype == 1 ? true : false,
                    child: TranslationLanguages()),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: cubit.servicetype == 1 ? false : true,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.all(color: AppColors.gray8)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              cubit.servicetype == 2
                                  ? "content_writer".tr()
                                  : "lang_edit".tr(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
                // IndividualType(),
                //   Row(
                //     children: [
                //       Expanded(child: ProviderType()),
                //       // Visibility(
                //       //     visible: cubit.selectedProviderType == 'individual'.tr()
                //       //         ? true
                //       //         : false,
                //       //     child: Expanded(child: IndividualType())),
                //     ],
                //   ),
                SliderData(),
                SizedBox(
                  height: 20,
                ),
                ProviderList()
              ],
            ),
          ),
        );
      },
    );
  }
}
