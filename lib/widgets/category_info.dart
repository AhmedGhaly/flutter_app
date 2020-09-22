import 'package:flutter/material.dart';
import 'package:meatApp/models/meal.dart';

class CategoryInfo extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  CategoryInfo(
    this.duration,
    this.complexity,
    this.affordability,
  );
  String get complexityString {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
    }
    return '';
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'luxurious';
      case Affordability.Pricey:
        return 'Pricey';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.access_alarm),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '$duration min',
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.work),
                SizedBox(
                  width: 6,
                ),
                Text(
                  complexityString,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.attach_money),
                SizedBox(
                  width: 6,
                ),
                Text(
                  affordabilityString,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
