import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/curved_app_bar.dart';
import '../../cubit/provider_filter_cubit.dart';
import '../../widget/providelist.dart';

class ProviderSearchScreen extends StatefulWidget {
  const ProviderSearchScreen({Key? key}) : super(key: key);

  @override
  State<ProviderSearchScreen> createState() => _ProviderSearchScreenState();
}

class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
  @override
  Widget build(BuildContext context) {
    ProviderSearchCubit cubit = context.read<ProviderSearchCubit>();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), child: CurvedAppBar()),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height:70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.gray8,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                          onChanged: (value) {
                            cubit.getProvidersSearch(value);
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'search'.tr(),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 20.0),
                            hintStyle: TextStyle(
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              ProviderList(),
            ],
          )),
    );
  }
}
