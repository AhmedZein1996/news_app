import 'package:flutter/material.dart';

import '../../core/constants.dart';


class AppBarIcon extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const AppBarIcon({
  required this.child,
  required this.onTap,
  super.key,
});

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: myGery.withOpacity(.5),
        shape: BoxShape.circle,
      ),
      child: child,
    ),
  );
}
}
