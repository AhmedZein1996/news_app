import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/search_screen/components/custom_tabbar_widget.dart';
import 'package:news_app/presentation/screens/search_screen/components/search_bar_widget.dart';
import 'package:news_app/presentation/screens/search_screen/components/top_widget.dart';
import '../../widgets/custom_app_bar.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen

  ({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildCustomAppBar(
        onTab: () {
          Navigator.of(context).pop();
        },
        leadingIcon: Icons.chevron_left,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TopWidget(),
                    SizedBox(
                      height: 12,
                    ),
                    SearchBarWidget(),
                    SizedBox(height: 10),
                    CustomTabBarWidget(),
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
    );
  }
}
