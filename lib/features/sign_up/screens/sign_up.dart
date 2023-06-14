import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:trj/core/widgets/curved_app_bar.dart';
import 'package:trj/core/widgets/custom_button.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../widgets/city_drop_down.dart';
enum serviceProvider { office, individual }
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
            CustomTextField(
                title: translate.tr("user_name"),
                textInputType: TextInputType.name,
                prefixWidget: ImageIcon(AssetImage(ImageAssets.profileIcon)),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 26,),
            CustomTextField(
                title: translate.tr("password"),
                textInputType: TextInputType.text,
                prefixWidget: Icon(Icons.lock_outline),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 26,),
            CustomTextField(
                title: translate.tr("email"),
                textInputType: TextInputType.emailAddress,
                prefixWidget: Icon(Icons.email_outlined),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 26,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: CityDropDown(
                  onChanged: (value){},
                  hint: "Language",
                  dropdownValue: "English",
                  items: ["English","Arabic","French"],
                  prefixIcon: Image.asset(ImageAssets.translateIcon)
              ),
            ),
            const SizedBox(height: 26,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: CityDropDown(
                onChanged: (value){},
                hint: "city",
                dropdownValue: "Cairo",
                items: ["Cairo","Alex","Aswan"],
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            const SizedBox(height: 26,),
            CustomTextField(
                title: translate.tr("phone_number"),
                textInputType: TextInputType.name,
                prefixWidget: Icon(Icons.local_phone_outlined),
                borderSide: BorderSide(color: AppColors.primary),
                backgroundColor: AppColors.white),
            const SizedBox(height: 26,),
            CustomTextField(
            title: translate.tr("prev_experience"),
            textInputType: TextInputType.name,
          prefixWidget: Padding(
            padding: const EdgeInsets.only(bottom: 70.0,left: 10,right: 10),
            child: Image.asset(ImageAssets.experienceIcon),
          ),
            borderSide: BorderSide(color: AppColors.primary),
            backgroundColor: AppColors.white,
          minLine: 5,
        ),
            const SizedBox(height: 26,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ImageIcon(AssetImage(ImageAssets.serviceProviderTypeIcon)),
              SizedBox(width: 10,),
              Text("service_provider_type").tr()
            ],),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text("office").tr(),
                      value: "office",
                      groupValue: serviceProvider,
                      onChanged: (value){
                        // setState(() {
                        //   gender = value.toString();
                        // });
                      },
                    ),
                  ),
                 Expanded(
                   child:  RadioListTile(
                   title: Text("individual").tr(),
                   value: "individual",
                   groupValue: serviceProvider,
                   onChanged: (value){
                     // setState(() {
                     //   gender = value.toString();
                     // });
                   },
                 ),)
                  // Radio(
                  //   toggleable: true,
                  //     splashRadius: 20,
                  //     activeColor: Colors.black,
                  //     value: serviceProvider.office,
                  //     groupValue: serviceProvider,
                  //     onChanged: (value){}),
                  // Radio(value: serviceProvider.individual,
                  //     groupValue: serviceProvider,
                  //     onChanged: (value){}),
                ],
              ),
            ),
            SizedBox(height: 44,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomButton(text: "submit".tr(), color: AppColors.primary, onClick: (){}),
            ),
            SizedBox(height: 20,)


          ],
        ),
      ),
    );
  }
}
