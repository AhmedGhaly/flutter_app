import 'package:flutter/material.dart';

import '../dummy/caregories_dummy.dart';
import '../widgets/meal_detials.dart';

class MealDetial extends StatelessWidget {
  static final detials = '/detial';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final mealData =
        (DUMMY_MEALS.where((element) => element.id == id)).toList()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealData.title}'),
      ),
      body: MealDetials(
        imageSrc: mealData.imageUrl,
        ingred: mealData.ingredients,
        steps: mealData.steps,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.delete,
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).pop(
      //       id,
      //     );
      //   },
      // ),
    );
  }
}
