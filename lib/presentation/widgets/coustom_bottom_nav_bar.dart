import 'package:flutter/material.dart';
import 'package:news_app/core/app_localization.dart';
import 'package:news_app/presentation/screens/bookmarks_screen/bookmarks_screen.dart';
import 'package:news_app/presentation/screens/home_screen/home_screen.dart';
import 'package:news_app/presentation/screens/profile_screen/profile_screen.dart';

import '../../core/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
  });

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavBarItem(
                  icon: Icons.home_rounded,
                  label: 'Home'.tr(context),
                  isSelected: MenuState.home == selectedMenu,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  }),
              CustomBottomNavBarItem(
                  icon: Icons.language,
                  label: 'Stock market'.tr(context),
                  isSelected: MenuState.internet == selectedMenu,
                  onTap: () {
                  }),
              CustomBottomNavBarItem(
                  icon: Icons.bookmark,
                  label: 'Bookmark'.tr(context),
                  isSelected: MenuState.bookworm == selectedMenu,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return BookMarksScreen();
                        },
                      ),
                    );
                  }),
              CustomBottomNavBarItem(
                icon: Icons.account_circle,
                label: 'Profile'.tr(context),
                isSelected: MenuState.profile == selectedMenu,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProfileScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}

class CustomBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function onTap;

  const CustomBottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              )
            : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : myGery,
            ),
            const SizedBox(
              width: 5,
            ),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
