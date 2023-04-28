import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_item.dart';

class NewsDetailsBody extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsBody({
  super.key,
  required this.newsItem,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  newsItem.imgUrl,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                newsItem.author,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            newsItem.article,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }
}