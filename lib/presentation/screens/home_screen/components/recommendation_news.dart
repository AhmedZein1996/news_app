import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_item.dart';
import '../../../../core/constants.dart';
import '../../news_deatails_screen/news_details_screen.dart';

class RecommendationNews extends StatelessWidget {
  final List<NewsItem> news;

  const RecommendationNews({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: news
          .map(
            (newsItem) => Column(
              children: [
                const SizedBox(height: 20),
                RecommendationNewsCard(
                  newsItem: newsItem,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class RecommendationNewsCard extends StatelessWidget {
  const RecommendationNewsCard({
    super.key,
    required this.newsItem,
  });

  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return NewsDetailsScreen(
              newsItem: newsItem,
            );
          }),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: width * .3,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                newsItem.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    newsItem.category,
                    style: const TextStyle(
                      color: myGery,
                    ),
                  ),
                  Text(
                    newsItem.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/person1.jpg',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        newsItem.author,
                        maxLines: 1,
                        style: const TextStyle(
                          color: myGery,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(newsItem.time,
                              style: const TextStyle(
                                color: myGery,
                              ),
                              overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
