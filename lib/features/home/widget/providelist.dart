import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' ;
import 'package:trj/core/utils/app_colors.dart';
import 'package:trj/core/widgets/no_data_widget.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_network_image.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/show_loading_indicator.dart';
import '../../provider_details/provider_details.dart';
import '../cubit/home_cubit.dart';

class ProviderList extends StatefulWidget {
  const ProviderList({Key? key}) : super(key: key);

  @override
  State<ProviderList> createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ProvidersHomeLoading) {
          return Center(child: ShowLoadingIndicator());
        } else if (state is ProvidersHomeError) {
          // return EmptyDataWidget();
          return Center(
            child:    NoDataWidget(onclick: () {
                  cubit.getProvidersHome(); 
                },
                  title: 'no_data'.tr(),
                ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async{
              cubit.getProvidersHome();
            },
            child:
            cubit.ProvidersList.isNotEmpty?
            ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.ProvidersList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ProviderModel providerModel =
                    cubit.ProvidersList.elementAt(index);
                return InkWell(
                  onTap: ()  {
                    showMaterialModalBottomSheet(
                      context: context,
                     expand: true,
                      backgroundColor: AppColors.transparent1,

                      builder: (context) => ProviderDetails(providerModel: providerModel,),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 15,
                            bottom: 0,
                            right: 20,
                            left: 0,
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              child: Container(
                                decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.all(Radius.circular(16),
                                ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.only(top: 30,right: 40,left: 20),
                                    child:
                                    Column(
                                      children: [
                                        Visibility(
                                          visible: cubit.servicetype==1?false:true,
                                          child: Text(
                                              cubit.selectedProviderType!=null? cubit.selectedProviderType.toString():'',
                                            maxLines: 2,

                                            style:
                                            TextStyle(fontSize: 14, color: AppColors.gray8,
                                                height: 2
                                            ),
                                          ),
                                        ), Text(
                                          providerModel.previousExperience??'',

                                          maxLines: 2,

                                          style:
                                          TextStyle(fontSize: 14, color: AppColors.gray8,
                                              height: 2
                                          ),
                                        ),
                                        Text(
                                          providerModel.experience??'',

                                          maxLines: 2,

                                          style:
                                          TextStyle(fontSize: 14, color: AppColors.gray8,
                                              height: 2
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            top: 8,
                            right: 20,


                            child: Container(

                              margin: EdgeInsets.only(top: 7),
                              padding: EdgeInsets.only(right: 55,left: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child:   Center(
                              child: Text(
                          providerModel.name,


                          style:
                          TextStyle(fontSize: 14, color: AppColors.white,

                          ),
                        ),
                            ),)),
                        Positioned(
                            top: 0,
                            right: 0,

                            child: Container(
                              width: 60,
                              height: 60,
                              child:ManageCircleNetworkImage(imageUrl: providerModel.image,height: 100,width: 100,),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ):
                NoDataWidget(onclick: () {
                  cubit.getProvidersHome(); 
                },
                  title: 'no_data'.tr(),
                )
        //        EmptyDataWidget(
        //   text: "no_data".tr(),
        // imagePath: ImageAssets.jobIcon,
        // ),
          );
        }
      },
    );
  }
}
