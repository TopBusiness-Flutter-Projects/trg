import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/model/cities_model.dart';
import 'package:trj/core/utils/app_colors.dart';

import '../../../core/model/service_type_model.dart';
import '../cubit/employment_cubit.dart';

class ProviderType extends StatefulWidget {
   ProviderType({Key? key}) : super(key: key);

  @override
  State<ProviderType> createState() => _ProviderTypeState();
}

class _ProviderTypeState extends State<ProviderType> {
List<String> providerTypes=['office'.tr(),'individual'.tr()];
  @override
  Widget build(BuildContext context) {
    EmploymentCubit cubit=context.read<EmploymentCubit>();
    return BlocBuilder<EmploymentCubit, EmploymentState>(
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: AppColors.gray8)
            ),
            child:  DropdownButtonHideUnderline(
              child: DropdownButton2(

                isExpanded: true,
                style: TextStyle(
                  decoration: TextDecoration.none
                ),
                hint:  Row(
                  children: [

                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'select_translator_type'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          decoration: TextDecoration.none
                        ),

                      ),
                    ),
                  ],
                ),
                items: providerTypes
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style:  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      decoration: TextDecoration.none
                    ),
                  ),
                ))
                    .toList(),
                value: cubit.selectedProviderType,
                onChanged: (value) {
                cubit.changeProviderType(value);
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding:  EdgeInsets.only(left: 14, right: 14),
                  elevation: 2,
                ),
                iconStyleData:  IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColors.gray8,
                  ),
                  iconSize: 30,


                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  padding: null,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 8,
                  offset:  Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius:  Radius.circular(40),

                    //thickness: MaterialStateProperty.all<double>(6),
               //     thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData:  MenuItemStyleData(
                  height: 40,

                  padding: EdgeInsets.only(left: 14, right: 14),

                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
