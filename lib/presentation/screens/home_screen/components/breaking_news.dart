import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';
import 'custom_carousel_slider.dart';
import 'news_type.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        NewsType(
          newsTypeText: 'Breaking News'.tr(context),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        const CustomCarouselSlider(
        ),
        /*  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) => buildNewsDot(index)),
        ),*/
      ],
    );
  }
}

/*Widget buildNewsDot(int index) {
  return AnimatedContainer(
    duration: const Duration(microseconds: 200),
    margin: const EdgeInsets.only(right: 5),
    width: index == 2 ? 20 : 6,
    height: 6,
    decoration: BoxDecoration(
      color: index == 2 ? Colors.blue : myGery,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({super.key,
    required this.category,
    required this.image,
    required this.newSSource,
    required this.newsText,
    required this.newsTime,
    required this.isCurrentNews,
  });

  final String category;
  final String image;
  final String newSSource;
  final String newsText;
  final String newsTime;
  final bool isCurrentNews;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .8,
      child: Card(
        elevation: isCurrentNews ? 10 : 0,
        shadowColor: isCurrentNews ? Colors.grey : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: '$newSSource -  ',
                            ),
                            TextSpan(
                              text: newsTime,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text.rich(
                          TextSpan(
                            text: newsText,
                            style: const TextStyle(
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
