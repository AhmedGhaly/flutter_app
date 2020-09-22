import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Setting extends StatelessWidget {
  static final settingRoute = '/setting';
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isVegan;
  final Function updatedValule;

  Setting({
    @required this.updatedValule,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
  Widget buildSwitchList({
    String title,
    String subTitle,
    bool currentValue,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) {
        updatedValule(
          value,
          title,
        );
      },
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
                    currentValue: isGlutenFree,
                    // updatedMethod: (newValue) {
                    //   setState(() {
                    //     isGlutenFree = newValue;
                    //   });
                    // },
                  ),
                  buildSwitchList(
                    title: 'vegetarian-free',
                    subTitle: 'get all meal with vegetarian-free',
                    currentValue: isVegetarian,
                    // updatedMethod: (newValue) {
                    //   setState(() {
                    //     isVegetarian = newValue;
                    //   });
                    // },
                  ),
                  buildSwitchList(
                    title: 'lacose-free',
                    subTitle: 'get all meal with lacose-free',
                    currentValue: isLactoseFree,
                    // updatedMethod: (newValue) {
                    //   setState(() {
                    //     isLactoseFree = newValue;
                    //   });
                    // },
                  ),
                  buildSwitchList(
                    title: 'vegan-free',
                    subTitle: 'get all meal with vegan-free',
                    currentValue: isVegan,
                    // updatedMethod: (newValue) {
                    //   setState(() {
                    //     isVegan = newValue;
                    //   });
                    // },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
