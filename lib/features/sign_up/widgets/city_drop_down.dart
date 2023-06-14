import 'package:flutter/material.dart';
//import 'package:khadamat/core/models/categories_model.dart';

import '../../../core/utils/app_colors.dart';


class CityDropDown extends StatelessWidget {
 // void Function(CategoriesDatum?)? onChanged ;
  void Function(dynamic)? onChanged ;
  void Function()? onTap;
  //List<CategoriesDatum>? items=[];
  List? items=[];
 // void Function(CategoriesDatum?)? onSaved;
  void Function()? onSaved;
  //CategoriesDatum? dropdownValue;
  var dropdownValue;
  String? hint;
  Widget? prefixIcon;

  CityDropDown({Key? key,
    required this.onChanged,
    this.onSaved,
    this.items,
    this.dropdownValue,
    required this.hint,
    this.prefixIcon,
    this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 46,

      child: DropdownButtonFormField(
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
         // suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
          prefixIconColor: AppColors.gray,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: AppColors.gray),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        dropdownColor: AppColors.white,
        value: dropdownValue,
        onChanged: onChanged,
        onTap:onTap ,
        items:
       // items?.map<DropdownMenuItem<CategoriesDatum>>((CategoriesDatum value) {
        items?.map<DropdownMenuItem>(( value) {
          return DropdownMenuItem(
            value: value,
            child: Text("${value}",
              style: TextStyle(fontSize: 16,color: AppColors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}