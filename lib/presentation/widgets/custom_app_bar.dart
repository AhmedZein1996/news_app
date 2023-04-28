import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_bar_icon.dart';

AppBar buildCustomAppBar({
  required IconData leadingIcon,
  List<Widget>? actions,
  required Function() onTab,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
    // automaticallyImplyLeading: false,
    leadingWidth: 100,
    leading: Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        AppBarIcon(
          onTap: onTab,
          child: Icon(
            leadingIcon,
            color: Colors.black,
          ),
        ),
      ],
    ),
    actions: actions,
  );
}
