import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';
import 'package:news_app/core/constants.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.15),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.search,
              color: myGery,
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: TextField(
                controller: _searchTextController,
                cursorColor: myGery,
                autofocus: true,
                decoration:  InputDecoration(
                    hintText: 'Search'.tr(context),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: myGery,
                      fontSize: 18,
                    )),
                style: const TextStyle(
                  color: myGery,
                  fontSize: 18,
                ),
                onChanged: (value) {},
              ),
            ),
            const Icon(
              Icons.filter_list,
              color: myGery,
            )
          ],
        ),
      ),
    );
  }
}
