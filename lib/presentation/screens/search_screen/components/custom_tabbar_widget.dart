import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/news_item.dart';
import 'package:news_app/presentation/screens/home_screen/components/recommendation_news.dart';
import '../../../../bussines_logic/cubit/localizations/localizations_cubit.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({super.key});

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget>
    with SingleTickerProviderStateMixin {
  final newsList = news;
  late TabController _tabController;

//  late List<NewsItem> newsOfCategory;
  late Set<String> categories;

  @override
  void initState() {
    // Create a set of unique categories
    categories =
        Set<String>.from(newsList.map((newsItem) => newsItem.category));
    // Create a list of NewsItem with one item per unique category
//    newsOfCategory = categories.map((category) {
//      // Find the first NewsItem that has the same category as the current category
//      final newsItem = newsList.firstWhere((item) => item.category == category);
//      return newsItem;
//    }).toList();
    _tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<NewsItem> getAllNewsOfSpecificCategory(String category) {
    return newsList.where((newsItem) => newsItem.category == category).toList();
  }

  //  @override
//  void initState() {
//    _tabController = TabController(length: newsList.length, vsync: this);
//    _tabController.addListener(_handleTabSelection);
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }
//
//  void _handleTabSelection() {
//    if (_tabController.indexIsChanging) {
//      setState(() {
//        selectedNewsCategory = newsList[_tabController.index].id;
//        currentIndex = _tabController.index;
//      });
//    }
//  }
  @override
  Widget build(BuildContext context) {
    final languageCode =
        context.read<LocalizationsCubit>().languageCode ;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TabBar(
            controller: _tabController,
            onTap: (index) {},
            indicator: BoxDecoration(
              color: Colors.blue, // Set indicator color to blue
              borderRadius: BorderRadius.circular(25),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(0),
            unselectedLabelColor: Colors.grey,
            // Set unselected color to grey
            isScrollable: true,
            tabs: categories
                .map((category) => Container(
                padding: languageCode == 'en'
                    ? const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16)
                    : const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 16), decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(category,maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 14,
                      ),)))
                .toList(),
          ),
        ),
        // SizedBox(height: 20,),
        SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: TabBarView(
            controller: _tabController,
            children: categories
                .map((category) => SingleChildScrollView(
                      child: RecommendationNews(
                        news: getAllNewsOfSpecificCategory(category),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
