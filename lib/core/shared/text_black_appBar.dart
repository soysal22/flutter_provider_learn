// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';

class TextBlackList extends StatelessWidget {
  TextBlackList({super.key, this.title = ""});

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: Constants.colorAppbar),
    );
  }
}
