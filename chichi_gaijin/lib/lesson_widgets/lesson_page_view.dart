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
        final GeneralLesson lesson = lessons[lessonsIndex];
        return Container(
          height: 300,
          width: 200,
          child: ListView.builder(
            itemCount: lesson.lessonCards.length,
            itemBuilder: (BuildContext context, int cardsIndex) {
              return Text('sldjfnlkn');
            },
          ),
        );
      },
    );
  }
}
