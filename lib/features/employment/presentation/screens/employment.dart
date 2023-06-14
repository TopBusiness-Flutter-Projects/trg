import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trj/core/utils/app_colors.dart';
class Employment extends StatefulWidget {
  const Employment({Key? key}) : super(key: key);

  @override
  State<Employment> createState() => _EmploymentState();
}

class _EmploymentState extends State<Employment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Text("select_provider".tr(),style: TextStyle(
                color: AppColors.orangeThirdPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
}


