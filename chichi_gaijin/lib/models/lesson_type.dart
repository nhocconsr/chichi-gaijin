import 'package:chichi_gaijin/models/content_type.dart';
import 'package:flutter/cupertino.dart';

class LessonType {
  final String title;
  final List<ContentType> lessonCards;

  const LessonType({
    @required this.lessonCards,
    @required this.title,
  });
}



/*abstract class LessonType {
  List<ContentType> get cards;

}

class GeneralLesson implements LessonType {
  final String title;
  final List<ContentType> lessonCards;

  const GeneralLesson({
    @required this.lessonCards,
    @required this.title,
  });

  @override
  get cards {
    return lessonCards;
  }
}*/
