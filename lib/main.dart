import 'package:flutter/material.dart';

import './pages/categories_page.dart';
import './pages/categories_recipiy.dart';
import './pages/meal_details_page.dart';
import './pages/taps_pages.dart';
import './pages/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myap',
      theme: ThemeData(
        fontFamily: 'Ranchers',
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.red,
              ),
              headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'RobotoCondensed',
              ),
              headline2: TextStyle(
                backgroundColor: Colors.pink[300],
              ),
              headline3: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: Categories(),
      routes: {
        '/': (ctx) => TapsPage(),
        CatigoryRecipe.routeName: (ctx) => CatigoryRecipe(),
        MealDetial.detials: (ctx) => MealDetial(),
        Setting.settingRoute: (ctx) => Setting(),
      },
      // when the page not found in route table
      onGenerateRoute: (settings) {},

      // when something went wring in the app
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}
