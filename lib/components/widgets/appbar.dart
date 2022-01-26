import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar buildAppBar(BuildContext context) {
  final icona = CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.lightGreen,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(
          icona,
          color: Colors.black,
        ),
        onPressed: () {},
      )
    ],
  );
}
