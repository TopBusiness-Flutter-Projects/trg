import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(ImageAssets.logoImage),
        ),
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),

      ],
    );
  }
}
