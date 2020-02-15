import 'package:chichi_gaijin/pages/build.dart';
import 'package:chichi_gaijin/pages/home.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CreateLesson>(create: (_) => CreateLesson()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => Home(),
          Build.routeName: (_) => Build(),
        },
      ),
    );
  }
}
