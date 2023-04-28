import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';

class NewsType extends StatelessWidget {
  final String newsTypeText;

  const NewsType({super.key, required this.newsTypeText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          newsTypeText,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
         Text(
          'View all'.tr(context),
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
