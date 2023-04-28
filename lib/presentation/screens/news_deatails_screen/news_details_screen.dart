import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_item.dart';
import 'components/news_details_body.dart';
import 'components/news_details_screen_app_bar.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsScreen({required this.newsItem, super.key});

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        Positioned.fill(
          child: CustomScrollView(
            slivers: [
              NewsDetailsScreenAppBar(
                newsItem: newsItem,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  NewsDetailsBody(
                    newsItem: newsItem,

                  ),
                ]),
              ),
            ],
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
  );
}
}