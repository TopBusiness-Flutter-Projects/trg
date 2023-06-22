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
import '../cubit/navigation_provider_cubit.dart';


class ZoomPrpvider extends StatefulWidget {
  const ZoomPrpvider({Key? key}) : super(key: key);

  @override
  _ZoomPrpviderState createState() => _ZoomPrpviderState();
}

class _ZoomPrpviderState extends State<ZoomPrpvider> {

    int _page = 2;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final GlobalKey<CurvedNavigationBarState> _bottomNavigationProviderKey = GlobalKey();

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

              height:85.0,
              child: Row(
                children: [
             

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<NavigationProviderCubit>().updateIndex(1);
                      },
                      child: Container(
                        color: AppColors.primary,
                        padding: EdgeInsets.only(bottom:_page == 1 ? 10:0),
                        child: Center(
                          child: Container(
                            width: 75,

                            decoration: BoxDecoration(
                                color: _page == 1
                                    ? AppColors.white
                                    : AppColors.primary,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  MySvgWidget(
                                    path: ImageAssets.jobIcon,
                                    size: _page != 1 ? 25 : 40,
                                    imageColor: _page == 1
                                        ? AppColors.orangeThirdPrimary
                                        : AppColors.white,
                                  ),
                                  Text(
                                    "employment".tr(),
                                    style: TextStyle(
                                        color:_page==1? AppColors.orangeThirdPrimary:AppColors.white,
                                        fontSize: 10),
                                  )
                                ],
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
                        context.read<NavigationProviderCubit>().updateIndex(2);
                      },
                      child: Container(
                        padding: EdgeInsets.only( bottom:_page == 2 ? 10:0),
                        child: Center(
                          child: Container(
                            width: 75,
                            decoration: BoxDecoration(
                                color:
                                _page == 2 ? AppColors.white : AppColors.primary,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  children: [
                                    MySvgWidget(
                                      path: ImageAssets.homeIcon,
                                      size: _page != 2 ? 25 : 40,
                                      imageColor: _page == 2
                                          ? AppColors.orangeThirdPrimary
                                          : AppColors.white,
                                    ),
                                    Text(
                                      "home".tr(),
                                      style: TextStyle(
                                          color:_page==2? AppColors.orangeThirdPrimary:AppColors.white,
                                          fontSize: 14),
                                    )
                                  ],
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
              color: AppColors.primary,
            ),
            body: pages(),
          );
        },
      );
    }

    Widget pages() {
      if (_page == 2) {
        return HomeScreen();
      } else {
        return Employment();
      }
    }
  
}




