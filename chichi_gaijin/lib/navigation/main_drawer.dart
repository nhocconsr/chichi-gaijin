import 'package:chichi_gaijin/pages/build.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Curriculum'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Create'),
            onTap: () {
              Navigator.popAndPushNamed(context, Build.routeName);
            },
          ),
        ],
      ),
    );
  }
}
