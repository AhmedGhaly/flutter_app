import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/setting_page.dart';

class MainDrawer extends StatelessWidget {
  Widget _bulidListTile(String title, Icon icon, Function onTabHandler) {
    return ListTile(
      onTap: onTabHandler,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Hello!!',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _bulidListTile(
            'Categories',
            Icon(Icons.restaurant),
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 10,
          ),
          _bulidListTile(
            'settings',
            Icon(Icons.settings),
            () {
              Navigator.of(context).pushReplacementNamed(Setting.settingRoute);
            },
          ),
        ],
      ),
    );
  }
}
