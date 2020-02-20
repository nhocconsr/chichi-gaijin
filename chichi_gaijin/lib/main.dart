import 'package:chichi_gaijin/pages/build.dart';
import 'package:chichi_gaijin/pages/home.dart';
import 'package:chichi_gaijin/pages/lesson.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:chichi_gaijin/providers/lessons.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CreateLesson>(create: (_) => CreateLesson()),
        ChangeNotifierProvider<Lessons>(create: (_) => Lessons()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //allows sending of arguments with route
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == Lesson.routeName)
            return MaterialPageRoute(
              builder: (_) {
                return Lesson(
                  lessonIndex: settings.arguments,
                );
              },
            );
          return MaterialPageRoute(
            builder: (_) {
              return Home();
            },
          );
        },
        routes: {
          '/': (context) => Home(),
          Build.routeName: (_) => Build(),
        },
      ),
    );
  }
}
