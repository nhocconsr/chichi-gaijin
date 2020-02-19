import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:flutter/cupertino.dart';

class Lessons with ChangeNotifier {
  List<LessonType> _lessons = [];

  List<LessonType> get lessons {
    return _lessons;
  }

  addGeneralLesson({List<ContentType> lessonCards, String title}) {
    _lessons.add(
      GeneralLesson(
        lessonCards: lessonCards,
        title: title,
      ),
    );

    notifyListeners();
  }
}
