import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

class Lessons with ChangeNotifier {
  List<LessonType> _lessons = [];
  List<Word>  _words = [];

  List<LessonType> get lessons {
    return _lessons;
  }

  List<Word> get words {
    return _words;
  }

  Future<void> addLesson({List<ContentType> lessonCards, String title}) async {
    List<ContentType> cards = [];
    for(int i = 0; i < lessonCards.length; i++){
      cards.add(lessonCards[i]);
      if (lessonCards[i] is VocabType)
        _words.add((lessonCards[i] as VocabType).word);
    }
    _lessons.add(
      LessonType(
        lessonCards: cards,
        title: title,
      ),
    );


    notifyListeners();
  }
}
