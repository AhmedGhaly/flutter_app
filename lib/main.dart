import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy/caregories_dummy.dart';
import './pages/categories_page.dart';
import './pages/categories_recipiy.dart';
import './pages/meal_details_page.dart';
import './pages/taps_pages.dart';
import './pages/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  List<Meal> updatedMeals = DUMMY_MEALS;
  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void updatedValue(bool v, String title) {
    switch (title) {
      case 'Gluten-Free':
        setState(() {
          _isGlutenFree = v;
        });
        return;
      case 'vegetarian-free':
        setState(() {
          _isVegetarian = v;
        });
        return;
      case 'lacose-free':
        setState(() {
          _isLactoseFree = v;
        });
        return;
      case 'vegan-free':
        setState(() {
          _isVegan = v;
        });
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      updatedMeals = DUMMY_MEALS.where((m) {
        if (_isGlutenFree && !m.isGlutenFree) return false;
        if (_isVegan && !m.isVegan) return false;
        if (_isVegetarian && !m.isVegetarian) return false;
        if (_isLactoseFree && !m.isLactoseFree) return false;
        return true;
      }).toList();
    });
    print(updatedMeals.length);
    print(_isGlutenFree);
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
        CatigoryRecipe.routeName: (ctx) => CatigoryRecipe(updatedMeals),
        MealDetial.detials: (ctx) => MealDetial(),
        Setting.settingRoute: (ctx) => Setting(
              isGlutenFree: _isGlutenFree,
              isLactoseFree: _isLactoseFree,
              isVegan: _isVegan,
              isVegetarian: _isVegetarian,
              updatedValule: updatedValue,
            ),
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
