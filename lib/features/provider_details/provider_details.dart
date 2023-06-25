import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trj/core/model/provider_model.dart';
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/utils/assets_manager.dart';
import 'package:trj/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/widgets/circle_network_image.dart';
import 'package:flutter_launch/flutter_launch.dart';
class ProviderDetails extends StatefulWidget {
  const ProviderDetails({Key? key, required this.providerModel})
      : super(key: key);
  final ProviderModel providerModel;

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: AppColors.transparent1,
      child: Container(
        color: AppColors.transparent1,
        margin: EdgeInsets.only(top: 200),
        child: Stack(
          children: [
            Positioned(
                top: 50,
                bottom: 0,
                right: 0,
                left: 0,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child:

                    Stack(
                      children: [
                        Positioned(
                          top:0,
                          right: 0,
                          left: 0,
                           bottom:50,
                          child: Center(
                            child: ListView(
                          shrinkWrap: true,
                              children: [
                                SizedBox(height: 50,),
                                Center(
                                  child: Text(
                                    widget.providerModel.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                        fontSize: 14, color: AppColors.black),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "city".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                    widget.providerModel.city??'',
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "address".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.address,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "provider".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.providerType==1?'office':"individual",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "experience".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.experience,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "phone".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.phone,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "email".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.email,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "previous_work".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),

                                  ],
                                ),
                                Center(
                                  child: Text(
                                    widget.providerModel.previousExperience,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "whats_app".tr()+":",
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      widget.providerModel.watts,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    widget.providerModel.aboutMe,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.orangeThirdPrimary),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.orangeThirdPrimary,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(child:
                                    Center(
                                      child:
                                      InkWell(

                                        child:Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                        Icon(Icons.phone_in_talk,color: AppColors.white,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'call'.tr(),
                                          style: TextStyle(
                                              fontSize: 14, color: AppColors.white),
                                        ),
                                      ],),
                                        onTap: () {
                                          _showTextInputDialog(context, 1);
                                        },
                                    )) ),
                                    Expanded(child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          _showTextInputDialog(context, 2);
                                        },
                                        child: Row(children: [
                                          Image.asset(ImageAssets.whatsappImage,color: AppColors.white,),
                                          SizedBox(width: 10,),
                                          Text(
                                            'whats_app'.tr(),
                                            style: TextStyle(
                                                fontSize: 14, color: AppColors.white),
                                          ),
                                        ],),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  child: ManageCircleNetworkImage(
                    imageUrl: widget.providerModel.image,
                    height: 100,
                    width: 100,
                  ),
                )),
            Positioned(
                left: 10,
                top: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(top: 30),
                    child: Icon(Icons.close,color: AppColors.white,),
                    decoration:BoxDecoration(
                      color: AppColors.orangeThirdPrimary,
                      shape: BoxShape.circle
                    ) ,
                  ),
                ))
          ],
        ),
      ),
    );
  }
 _showTextInputDialog(BuildContext context,int type) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
           height: 165,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                )
            ),
            child: Column(
              children: [
                Center(
                  child: Text("amanh".tr(),
                  style: TextStyle(color: AppColors.orangeThirdPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                SizedBox(height: 20,),
                CustomButton(text: "close".tr(), color: AppColors.orangeThirdPrimary, onClick: () async {
                  if(type==1){
                launch("tel://${widget.providerModel.phone}");
                  }
                  else{
                    await FlutterLaunch.launchWhatsapp(phone: widget.providerModel.watts,message: "");

                  }
                },)
              ],
            ),
          ));
        });
  }

}
