import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyLesson extends StatelessWidget {
  final int lessonsIndex;
  final int cardsIndex;

  const BodyLesson({@required this.lessonsIndex, @required this.cardsIndex});
  @override
  Widget build(BuildContext context) {
    final lessonsProvider = Provider.of<Lessons>(context);
    final BodyType card =
        lessonsProvider.lessons[lessonsIndex].lessonCards[cardsIndex];
    return Center(
      child: Text(card.body),
    );
  }
}
