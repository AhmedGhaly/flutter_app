import 'package:flutter/material.dart';

import '../models/meal.dart';
import './category_info.dart';
import '../pages/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final int duration;
  final String id;
  final Complexity complexity;
  final String title;
  final Affordability affordability;
  final List<String> categories;
  // final Function removeItem;
  MealItem({
    @required this.id,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.categories,
    @required this.duration,
    // @required this.removeItem,
  });

  void showDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetial.detials,
      arguments: id,
    );
    // .then(
    //   (value) => removeItem(id),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDetails(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        // padding: EdgeInsets.all(15),
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                // enforce the child to be a certain shap
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular((15)),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    color: Colors.black54,
                    width: MediaQuery.of(context).size.width * .7,
                    child: FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        // softWrap: true,
                        // overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.pink[200],
              ),
              padding: const EdgeInsets.all(20),
              child: CategoryInfo(
                duration,
                complexity,
                affordability,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
