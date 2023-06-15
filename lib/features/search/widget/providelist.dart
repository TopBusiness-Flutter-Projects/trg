import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/utils/app_colors.dart';

import '../../../core/model/provider_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/circle_network_image.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/show_loading_indicator.dart';
import '../cubit/provider_filter_cubit.dart';

class ProviderList extends StatefulWidget {
  const ProviderList({Key? key}) : super(key: key);

  @override
  State<ProviderList> createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  @override
  Widget build(BuildContext context) {
    ProviderSearchCubit cubit = context.read<ProviderSearchCubit>();
    return BlocBuilder<ProviderSearchCubit,  ProvidersSearchState>(
      builder: (context, state) {
        if (state is ProvidersSearchLoading) {
          return ShowLoadingIndicator();
        } else if (state is ProvidersSearchError) {
          // return EmptyDataWidget();
          return  Center(
            child: Text(
              "no_data".tr(),
              style: TextStyle(
                color: AppColors.secondPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          if(cubit.ProvidersList.isNotEmpty){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cubit.ProvidersList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ProviderModel providerModel =
                  cubit.ProvidersList.elementAt(index);
              return Container(
                height: 130,
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
                                Text(
                                  providerModel.aboutMe,
                                  maxLines: 2,

                                  style:
                                      TextStyle(fontSize: 14, color: AppColors.gray8,
                                        height: 2
                                     ),
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
              );
            },
          );}
          else{
            return  Center(
              child: Text(
               "no_data".tr(),
                style: TextStyle(
                  color: AppColors.secondPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        }
      },
    );
  }
}
