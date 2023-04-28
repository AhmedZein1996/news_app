import 'package:news_app/core/Strings/globle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {

 static cacheLanguageCode(String languageCode) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(cachedLang, languageCode);
  }

  static Future<String> getCachedLanguageCode() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? cachedLanguageCode = sharedPreferences.getString(cachedLang);
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    }
    return 'en';
  }
}
