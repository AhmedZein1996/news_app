import 'package:translator/translator.dart';

import '../../data/models/news_item.dart';

Future<String> translate(String text) async {
  final translator = GoogleTranslator();
  final Translation translation =
      await translator.translate(text, from: 'en', to: 'ar');
  return translation.text;
}

Future<void> translateAPiData(List<NewsItem> newsInEnglish) async {
  final translatedNews = await Future.wait(
    newsInEnglish.map(
      (item) async {
        final title = await translate(item.title);
        final category = await translate(item.category);
        final article = await translate(item.article);
        final time = await translate(item.time);
        return NewsItem(
          id: item.id,
          title: title,
          imgUrl: item.imgUrl,
          category: category,
          author: item.author,
          isFavorite: item.isFavorite,
          authorImgUrl: item.authorImgUrl,
          article: article,
          time: time,
        );
      },
    ),
  );
  setNews(translatedNews);
}
