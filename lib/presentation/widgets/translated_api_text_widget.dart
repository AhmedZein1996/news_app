//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:news_app/core/helper/translate_text_from_api_helper.dart';
//
//import '../../bussines_logic/cubit/localizations/localizations_cubit.dart';
//
//class TranslateTextFromApiWidget extends StatelessWidget {
//  final String text;
//  final TextStyle textStyle;
//  final int? maxLines;
//  final TextOverflow? overflow;
//  final bool? softWrap;
//
//  const TranslateTextFromApiWidget({
//    super.key,
//    required this.textStyle,
//    required this.text,
//    this.maxLines,
//    this.overflow,
//    this.softWrap,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    final languageCode =
//        context.read<LocalizationsCubit>().state.locale.languageCode;
//    return languageCode == 'en'
//        ? Text(
//            text,
//            maxLines: maxLines,
//            overflow: TextOverflow.ellipsis,
//            softWrap: false,
//            style: textStyle,
//          )
//        : FutureBuilder<String>(
//            future: translate(text),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return Text(
//                  snapshot.data ?? '',
//                  maxLines: maxLines,
//                  overflow: overflow,
//                  softWrap: softWrap,
//                  style: textStyle,
//                );
//              } else {
//                return const Text('');
//              }
//            },
//          );
//  }
//}
