import 'dart:async';
import 'package:trg/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trg/core/utils/assets_manager.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer _timer;

  _goNext() {
  //  Navigator.pushNamed(context, Routes.chooseCountryRoute);
    // _getStoreUser();
  }

  _startDelay() async {
    _timer = Timer(
      const Duration(milliseconds: 2500),
      () {
        // Preferences.instance.clearUserData();
        _goNext();
      },
    );
  }

  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // UserModel userModel = await Preferences.instance.getUserModel();
  }

  @override
  void initState() {
    super.initState();
    // context.read<SplashCubit>().getAdsOfApp();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Image.asset(ImageAssets.topcircleImage)),
          Expanded(
              child: Center(
            child: Hero(
              tag: 'logo',
              child: SizedBox(
                // width: 300,
                // height: 300,
                child: Image.asset(ImageAssets.logoImage),
              ),
            ),
          )),
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(ImageAssets.bottomcircleImage,
                fit: BoxFit.fitWidth),
          )
        ],
      ),
      backgroundColor: AppColors.primary,
    );
  }
}
