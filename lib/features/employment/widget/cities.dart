import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trj/core/model/cities_model.dart';
import 'package:trj/core/utils/app_colors.dart';

import '../cubit/employment_cubit.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmploymentCubit, EmploymentState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: AppColors.gray8)
          ),
          child: DropdownMenuItem<CitiesModel>(
             child: Container(),
        //    child: Text(),

          ),
        );
      },
    );
  }
}
