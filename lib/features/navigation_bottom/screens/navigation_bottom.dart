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

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return ZoomDrawer(
      controller: z,
      isRtl: true,
      borderRadius: 25,
      style: DrawerStyle.defaultStyle,
      openCurve: Curves.linearToEaseOut,
      slideWidth: MediaQuery.of(context).size.width * 0.80,
      duration: const Duration(milliseconds: 700),
      angle: 0.0,
      drawerShadowsBackgroundColor: AppColors.primary,
      shadowLayer1Color: AppColors.transparent,
      shadowLayer2Color: AppColors.black.withOpacity(0.1),
      showShadow: true,
      overlayBlur: 0,
      moveMenuScreen: false,
      mainScreenTapClose: true,
      menuScreenOverlayColor: AppColors.primary,
      menuBackgroundColor: AppColors.white,
      mainScreen: const NavigatorBar(),
      menuScreen: Container(),
      // menuScreen:
      // MenuScreenWidget(
      //   closeClick: () => z.close?.call(),
      // ),
    );
  }
}

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  // final userDataModel userDataModel;

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _page = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        _page = context.read<NavigationCubit>().index;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
          ),
          key: _scaffoldKey,
          bottomNavigationBar: BottomAppBar(
            key: _bottomNavigationKey,

            height:85.0,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      z.toggle!.call();
                      //  context.read<NavigationCubit>().updateIndex(2);
                    },
                    child: Container(
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                            color:
                            AppColors.primary,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14))),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: MySvgWidget(
                                  path: ImageAssets.menuIcon,
                                  size: _page != 2 ? 25 : 40,
                                  imageColor:  AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<NavigationCubit>().updateIndex(1);
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
                      context.read<NavigationCubit>().updateIndex(2);
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
