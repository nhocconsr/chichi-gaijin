import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleLesson extends StatelessWidget {
  final int lessonsIndex;
  final int cardsIndex;

  const TitleLesson({@required this.lessonsIndex, @required this.cardsIndex});

  @override
  Widget build(BuildContext context) {
    final lessonsProvider = Provider.of<Lessons>(context);
    final TitleType card =
        lessonsProvider.lessons[lessonsIndex].lessonCards[cardsIndex];
    return Column(
      children: <Widget>[
        Text(card.title),
        if (card.subtitle != null) Text(card.subtitle),
      ],
    );
  }
}
