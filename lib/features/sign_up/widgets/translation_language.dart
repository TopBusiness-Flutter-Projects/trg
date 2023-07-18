import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/model/cities_model.dart';
import 'package:trj/core/utils/app_colors.dart';

import '../../../core/model/service_type_model.dart';
import '../../../core/model/translation_language.dart';
import '../cubit/register_cubit.dart';

class TranslationLanguages extends StatefulWidget {
  TranslationLanguages({Key? key}) : super(key: key);

  @override
  State<TranslationLanguages> createState() => _TranslationLanguagesState();
}

class _TranslationLanguagesState extends State<TranslationLanguages> {
  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: AppColors.gray8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<TranslationLanguage>(
              isExpanded: true,
              style: TextStyle(decoration: TextDecoration.none),
              hint: Row(
                children: [
                  Icon(Icons.translate),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'select_translate_languge'.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
              items: cubit.translationList
                  .map((item) => DropdownMenuItem<TranslationLanguage>(
                        value: item,
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              decoration: TextDecoration.none),
                        ),
                      ))
                  .toList(),
              value: cubit.selectlanguge,
              onChanged: (value) {
                cubit.changeTranslationLanguge(value);
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                padding: EdgeInsets.only(left: 14, right: 14),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
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
                offset: Offset(-20, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40),

                  //thickness: MaterialStateProperty.all<double>(6),
                  //     thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        );
      },
    );
  }
}
