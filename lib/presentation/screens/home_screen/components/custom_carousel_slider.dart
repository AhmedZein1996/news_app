import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussines_logic/cubit/localizations/localizations_cubit.dart';
import 'package:news_app/data/models/news_item.dart';
import 'package:news_app/presentation/screens/news_deatails_screen/news_details_screen.dart';
import '../../../../core/constants.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void dispose() {
    _controller.stopAutoPlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode =
        context.read<LocalizationsCubit>().languageCode;
    final List<Widget> imageSliders = news
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return NewsDetailsScreen(
                          newsItem: item,
                        );
                      }),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item.imgUrl,
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        top: 10,
                        left: languageCode == 'en' ? 10 : null,
                        right: languageCode == 'en' ? null : 10,
                        child: Container(
                          padding: languageCode == 'en'
                              ? const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16)
                              : const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: Text(
                            item.category,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    item.author,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Text(
                                    '•',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    item.time,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
//                            Padding(
//                              padding:
//                                  const EdgeInsets.symmetric(horizontal: 20.0),
//                              child: Text(
//                                '${item.author} • ${item.time}',
//                                style: const TextStyle(
//                                  color: Colors.white,
//                                ),
//                              ),
//                            ),
                            Container(
                              width: 1000,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        )
        .toList();
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                width: _current == entry.key ? 25 : 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: _current == entry.key
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    borderRadius: _current == entry.key
                        ? BorderRadius.circular(8.0)
                        : null,
                    color: _current == entry.key
                        ? Colors.blue
                        : myGery.withOpacity(.3)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
