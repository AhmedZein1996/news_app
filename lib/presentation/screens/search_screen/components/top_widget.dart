import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';
import 'package:news_app/core/constants.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Discover'.tr(context) , style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black),),
        Text('News around world'.tr(context) , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: myGery),),

      ],
    );
  }
}
