import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/cupertino.dart';
//not necessary, but qol when using two providers
class FinalizeLessonProxy {
  final CreateLesson createLesson;
  final Lessons lessons;

  const FinalizeLessonProxy({
    this.createLesson,
    this.lessons
  });

  finalize({@required List<ContentType> lessonCards, @required String title}){
    lessons.addLesson(lessonCards: lessonCards, title: title).then((_) => {createLesson.clear()});
  }
}