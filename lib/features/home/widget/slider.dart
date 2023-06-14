import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/app_colors.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_network_image.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/show_loading_indicator.dart';
import '../cubit/home_cubit.dart';
import 'banner.dart';

class SliderData extends StatefulWidget {
  const SliderData({Key? key}) : super(key: key);

  @override
  State<SliderData> createState() => _SliderDataState();
}

class _SliderDataState extends State<SliderData> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SliderHomeLoading) {
          return ShowLoadingIndicator();
        } else if (state is SliderHomeError) {
          // return EmptyDataWidget();
          return EmptyDataWidget(
            text: "no_data".tr(),
            imagePath: ImageAssets.jobIcon,
          );
        } else {
          return BannerWidget(sliderData: cubit.sliderList,isDotes: true,);
        }
      },
    );
  }
}
