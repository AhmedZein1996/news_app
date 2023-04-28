import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/news_item.dart';
import '../../../../bussines_logic/cubit/localizations/localizations_cubit.dart';
import '../../../widgets/app_bar_icon.dart';

class NewsDetailsScreenAppBar extends StatefulWidget {
  final NewsItem newsItem;

  const NewsDetailsScreenAppBar({super.key, required this.newsItem});

  @override
  State<NewsDetailsScreenAppBar> createState() =>
      _NewsDetailsScreenAppBarState();
}

class _NewsDetailsScreenAppBarState extends State<NewsDetailsScreenAppBar> {
  bool _isFavorite = false;

  @override
  void initState() {
    _isFavorite = widget.newsItem.isFavoriteNews;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode =
        context.read<LocalizationsCubit>().languageCode;
    final size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      expandedHeight: size.height * .4,
      collapsedHeight: orientation == Orientation.portrait
          ? size.height * .1
          : size.height * .2,
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          AppBarIcon(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
            ),
          ),
        ],
      ),
      actions: [
        AppBarIcon(
            onTap: () {
              widget.newsItem.favoriteToggle();
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            child: Icon(
              _isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
            )),
        const SizedBox(
          width: 6,
        ),
        AppBarIcon(
            onTap: () {},
            child: const Icon(
              Icons.menu,
            )),
        const SizedBox(
          width: 6,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.newsItem.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 50,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    child: Padding(
                      padding: languageCode == 'en'
                          ? const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16)
                          : const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 16),
                      child: Text(
                        widget.newsItem.category,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: Text(
                      widget.newsItem.title,
                      maxLines: 3,
                      style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          widget.newsItem.author,
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
                          widget.newsItem.time,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
//                  Text(
//                    '${widget.newsItem.author} • ${widget.newsItem.time}',
//                    style: const TextStyle(
//                      color: Colors.white,
//                    ),
//                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: size.width,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(
                  40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}