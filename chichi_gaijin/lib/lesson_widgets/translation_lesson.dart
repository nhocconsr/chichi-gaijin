import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:chichi_gaijin/widgets/translator_sentence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TranslationLesson extends StatelessWidget {
  final int lessonsIndex;
  final int cardsIndex;

  const TranslationLesson(
      {@required this.lessonsIndex, @required this.cardsIndex});
  @override
  Widget build(BuildContext context) {
    final lessonsProvider = Provider.of<Lessons>(context);
    final TranslationType card =
        lessonsProvider.lessons[lessonsIndex].lessonCards[cardsIndex];
        //TODO: this v
    return TranslatorSentence(card: card);
  }
}
