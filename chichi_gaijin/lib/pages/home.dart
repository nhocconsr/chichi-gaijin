import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/navigation/main_drawer.dart';
import 'package:chichi_gaijin/pages/lesson.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
//external imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//first page someone sees when starting the app
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lessonsProvider = Provider.of<Lessons>(context);
    final lessons = lessonsProvider.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (BuildContext context, int lessonsIndex) {
            final LessonType lesson = lessons[lessonsIndex];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Lesson.routeName, arguments: lessonsIndex),
              child: Text(lesson.title));
          }),
      drawer: MainDrawer(),
    );
  }
}
