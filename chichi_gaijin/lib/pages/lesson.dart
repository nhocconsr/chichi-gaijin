import 'package:chichi_gaijin/lesson_widgets/lesson_page_view.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lesson extends StatelessWidget {
  static const routeName = '/lessons';

  final int lessonIndex;

  const Lesson({@required this.lessonIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('lesson'),
        ),
        body: Consumer<Lessons>(
          builder: (_, lessonsProvider, __) {
            return LessonPageView(lessonsIndex: lessonIndex);
          },
        ),
      ),
    );
  }
}
