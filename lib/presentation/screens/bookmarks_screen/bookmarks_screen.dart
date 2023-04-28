import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/data/models/news_item.dart';
import '../../widgets/coustom_bottom_nav_bar.dart';
import 'package:news_app/presentation/screens/home_screen/components/recommendation_news.dart';


class BookMarksScreen extends StatelessWidget {
  final favoritesNews = news.where((item) => item.isFavorite).toList();

  BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Your Favorites'.tr(context),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.blue)),),

      body: favoritesNews.isEmpty
          ? Center(
              child: Text(
                'no favorites'.tr(context),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8 ),
                  child: RecommendationNews(
                    news: favoritesNews,
                  ),
                ),
              ),
            ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.bookworm,
      ),
    );
  }
}
