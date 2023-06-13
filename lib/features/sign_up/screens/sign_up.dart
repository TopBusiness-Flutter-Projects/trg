import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:trj/core/widgets/curved_app_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child:CurvedAppBar()
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 36,),
            Text(
              "new_login",
              style: TextStyle(
                  color: AppColors.orangeThirdPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ).tr(),
            Text(
              "fill_data",
              style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ).tr(),
            const SizedBox(height: 28,),

          ],
        ),
      ),
    );
  }
}
