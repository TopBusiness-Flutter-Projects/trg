import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/curved_app_bar.dart';
import '../../widget/providelist.dart';

class ProviderFilterScreen extends StatefulWidget {
  const ProviderFilterScreen({Key? key}) : super(key: key);

  @override
  State<ProviderFilterScreen> createState() => _ProviderFilterScreenState();
}

class _ProviderFilterScreenState extends State<ProviderFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child:CurvedAppBar()
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProviderList()


      ),
    );
  }
}
