import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

class Lessons with ChangeNotifier {
  List<LessonType> _lessons = [];

  List<LessonType> get lessons {
    return _lessons;
  }

  Future<void> addLesson({List<ContentType> lessonCards, String title}) async {
    List<ContentType> cards = [];
    List<Word> words = [];
    for (int i = 0; i < lessonCards.length; i++) {
      cards.add(lessonCards[i]);
      if (lessonCards[i] is VocabType)
        words.add((lessonCards[i] as VocabType).word);
    }
    _lessons.add(
      LessonType(
        lessonCards: cards,
        title: title,
        words: words,
      ),
    );

    notifyListeners();
  }
}
