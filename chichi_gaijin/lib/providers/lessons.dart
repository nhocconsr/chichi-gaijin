import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:flutter/cupertino.dart';

class Lessons with ChangeNotifier {
  List<LessonType> _lessons = [];

  List<LessonType> get lessons {
    return _lessons;
  }

  Future<void> addLesson({List<ContentType> lessonCards, String title}) async {
    List<ContentType> cards = []..addAll(lessonCards);
    _lessons.add(
      LessonType(
        lessonCards: cards,
        title: title,
      ),
    );

    notifyListeners();
  }
}
