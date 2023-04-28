import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helper/translate_text_from_api_helper.dart';
import 'package:news_app/data/datasources/local/language_cach_helper.dart';
import 'package:news_app/data/models/news_item.dart';
part 'localizations_state.dart';

class LocalizationsCubit extends Cubit<LocalizationsState>{
  LocalizationsCubit():super(ChangeLocaleState(locale: const Locale('en')));
   String languageCode = 'en';
  Future<void> getSavedLanguage()async{
    final cachedLanguageCode = await LanguageCacheHelper.getCachedLanguageCode();
    languageCode =cachedLanguageCode;
    if(languageCode == 'ar'){
      emit(LocalizationsLoadingState());
      await translateAPiData(newsInEnglish);
    }else{
      setNews(newsInEnglish);
    }
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }
  Future<void> changeAppLanguage(String languageCode)async{
    this.languageCode  = languageCode;
    await LanguageCacheHelper.cacheLanguageCode(languageCode);
    if(languageCode == 'ar'){
      emit(LocalizationsLoadingState());
      await translateAPiData(newsInEnglish);
    }else{
      setNews(newsInEnglish);
    }
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
 String get getLanguageCode =>  languageCode;
}
