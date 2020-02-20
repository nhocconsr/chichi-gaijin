import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VocabLesson extends StatelessWidget {
  final int lessonsIndex;
  final int cardsIndex;

  const VocabLesson({@required this.lessonsIndex, @required this.cardsIndex});
  @override
  Widget build(BuildContext context) {
    final lessonsProvider = Provider.of<Lessons>(context);
    final VocabType card =
        lessonsProvider.lessons[lessonsIndex].lessonCards[cardsIndex];
    return Column(
      children: <Widget>[
        Text(card.word.japanese),
        Text(card.word.kana),
        Text(card.word.romaji),
        Text(card.word.english),
        Text(card.word.definition),
      ],
    );
  }
}
