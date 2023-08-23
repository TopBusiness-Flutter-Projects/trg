import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:trj/features/employment/widget/individual_type.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../filter_providers/cubit/provider_filter_cubit.dart';
import '../../cubit/employment_cubit.dart';
import '../../widget/cities.dart';
import '../../widget/provider_type.dart';
import '../../widget/services_type.dart';

class Employment extends StatefulWidget {
  const Employment({Key? key}) : super(key: key);

  @override
  State<Employment> createState() => _EmploymentState();
}

class _EmploymentState extends State<Employment> {
  @override
  Widget build(BuildContext context) {
    EmploymentCubit cubit = context.read<EmploymentCubit>();

    return Scaffold(
      body: BlocBuilder<EmploymentCubit, EmploymentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "select_provider".tr(),
                    style: TextStyle(
                        color: AppColors.orangeThirdPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Cities(),
                SizedBox(
                  height: 20,
                ),
                ServicesType(),
                SizedBox(
                  height: 20,
                ),
                ProviderType(),
                SizedBox(
                  height: 20,
                ),

                   IndividualType(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "search".tr(),
                    color: AppColors.primary,
                    onClick: () {
                      context
                          .read<ProviderFilterCubit>()
                          .getProvidersProviderFilter(
                          cubit.selectedCity!.id,
                          cubit.selectedServiceType!.id,
                          cubit.selectedProviderType == "individual".tr()
                              ? 2
                              :  cubit.selectedProviderType == "content_writer".tr()?3:  cubit.selectedProviderType == "lang_edit".tr()?4: 1,

                          "",
                         );
                      Navigator.pushNamed(context, Routes.providerFilterRoute);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
