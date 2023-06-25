import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:trj/features/navigation_bottom/cubit/navigation_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../employment/presentation/screens/employment.dart';
import '../../home/presentation/screens/home.dart';
import '../../provider_profile/screen/provider_profile.dart';
import '../../provider_setting/screen/provider_setting.dart';
import '../cubit/navigation_provider_cubit.dart';

class ZoomPrpvider extends StatefulWidget {
  const ZoomPrpvider({Key? key}) : super(key: key);

  @override
  _ZoomPrpviderState createState() => _ZoomPrpviderState();
}

class _ZoomPrpviderState extends State<ZoomPrpvider> {
  int _page = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationProviderKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationProviderCubit, NavigationProviderState>(
      builder: (context, state) {
        _page = context.read<NavigationProviderCubit>().index;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
          ),
          key: _scaffoldKey,
          bottomNavigationBar: BottomAppBar(
            key: _bottomNavigationProviderKey,

            height: 85.0,
            child: Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomRight: Radius.circular(16))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<NavigationProviderCubit>().updateIndex(0);
                      },
                      child: Container(

                        width: MediaQuery.of(context).size.width / 2,
                        color: _page == 0
                            ? AppColors.orangeThirdPrimary
                            : AppColors.primary,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: MySvgWidget(
                                path: ImageAssets.userIcon,
                                size: 40,
                                imageColor: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<NavigationProviderCubit>().updateIndex(1);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: _page == 1
                            ? AppColors.orangeThirdPrimary
                            : AppColors.primary,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: MySvgWidget(
                                path: ImageAssets.menu1Icon,
                                size: 40,
                                imageColor: AppColors.white,
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
            //    color: AppColors.primary,
          ),
          body: pages(),
        );
      },
    );
  }

  Widget pages() {
    if (_page == 0) {
      return ProviderProfile();
    } else {
      return ProviderSetting();
    }
  }
}
