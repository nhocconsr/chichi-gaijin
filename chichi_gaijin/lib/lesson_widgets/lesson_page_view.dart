import 'package:chichi_gaijin/lesson_widgets/body_lesson.dart';
import 'package:chichi_gaijin/lesson_widgets/title_lesson.dart';
import 'package:chichi_gaijin/lesson_widgets/translation_lesson.dart';
import 'package:chichi_gaijin/lesson_widgets/vocab_lesson.dart';
import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonPageView extends StatelessWidget {
  final int lessonsIndex;

  const LessonPageView({@required this.lessonsIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<Lessons>(
      builder: (_, lessonsProvider, __) {
        final lessons = lessonsProvider.lessons;
        final LessonType lesson = lessons[lessonsIndex];
        return Container(
          child: PageView.builder(
            itemCount: lesson.lessonCards.length,
            itemBuilder: (BuildContext context, int cardsIndex) {
              final card = lesson.lessonCards[cardsIndex];
              if (card is TitleType)
                return TitleLesson(cardsIndex: cardsIndex, lessonsIndex: lessonsIndex,);
              else if (card is BodyType)
                return BodyLesson(cardsIndex: cardsIndex, lessonsIndex: lessonsIndex,);
              else if (card is VocabType)
                return VocabLesson(cardsIndex: cardsIndex, lessonsIndex: lessonsIndex,);
              else if (card is TranslationType)
                return TranslationLesson(cardsIndex: cardsIndex, lessonsIndex: lessonsIndex,);
              else
                return Text('thats the wrong number');
            },
          ),
        );
      },
    );
  }
}
