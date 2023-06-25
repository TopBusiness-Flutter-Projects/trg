import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child:
            ListView(
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
                    Expanded(child: ServicesType()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: ProviderType()),
                    Visibility(
                        visible: cubit.selectedProviderType == 'individual'.tr()
                            ? true
                            : false,
                        child: Expanded(child: IndividualType())),
                  ],
                ),
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
