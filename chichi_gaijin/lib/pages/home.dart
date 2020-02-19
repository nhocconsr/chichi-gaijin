import 'package:chichi_gaijin/models/lesson_type.dart';
import 'package:chichi_gaijin/navigation/main_drawer.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            final GeneralLesson lesson = lessons[lessonsIndex];
            return Text(lesson.title);
          }),
      drawer: MainDrawer(),
    );
  }
}
