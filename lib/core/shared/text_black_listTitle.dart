// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class TextBlackListTile extends StatelessWidget {
  TextBlackListTile({super.key, this.title = "", this.color = Colors.black});

  String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(color: color),
    );
  }
}
