import 'package:flutter/material.dart';
import '../../../core/app_localization.dart';
import '../search_screen/search_screen.dart';
import '../../../core/constants.dart';
import '../../../data/models/news_item.dart';
import '../../widgets/app_bar_icon.dart';
import 'components/breaking_news.dart';
import '../../widgets/coustom_bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';
import 'components/news_type.dart';
import 'components/recommendation_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //  extendBodyBehindAppBar: true,
      //  extendBody: true,
      appBar: buildCustomAppBar(
          leadingIcon: Icons.menu,
          onTab: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }),
            );
          },
          actions: [
            AppBarIcon(
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchScreen();
                  }),
                );
              },
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarIcon(
              child: const Badge(
                label: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const BreakingNews(),
                    const SizedBox(height: 20),
                     NewsType(newsTypeText: "recommendation_text".tr(context)),
                    RecommendationNews(
                      news: news,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * .1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
