
import 'package:chichi_gaijin/models/content_type.dart';
import 'package:flutter/cupertino.dart';

abstract class LessonType {}

class GeneralLesson implements LessonType {
  final List<ContentType> lessonCards;
  final String title;

  const GeneralLesson({@required this.lessonCards, @required this.title,});
}