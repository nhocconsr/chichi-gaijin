import 'package:chichi_gaijin/navigation/main_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'),),
      body: Container(child: Text('body'),),
      drawer: MainDrawer(),
    );
  }
}
