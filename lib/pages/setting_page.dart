import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Setting extends StatefulWidget {
  static final settingRoute = '/setting';

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isGlutenFree = false;

  bool _isVegetarian = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  Widget buildSwitchList({
    String title,
    String subTitle,
    bool currentValue,
    Function updatedMethod,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updatedMethod,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text(
                'set up your settings.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchList(
                    title: 'Gluten-Free',
                    subTitle: 'get all meal with Gluten-Free',
                    currentValue: _isGlutenFree,
                    updatedMethod: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  buildSwitchList(
                    title: 'vegetarian-free',
                    subTitle: 'get all meal with vegetarian-free',
                    currentValue: _isVegetarian,
                    updatedMethod: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                  buildSwitchList(
                    title: 'lacose-free',
                    subTitle: 'get all meal with lacose-free',
                    currentValue: _isLactoseFree,
                    updatedMethod: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                  buildSwitchList(
                    title: 'vegan-free',
                    subTitle: 'get all meal with vegan-free',
                    currentValue: _isVegan,
                    updatedMethod: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
