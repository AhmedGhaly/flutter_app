import 'package:flutter/material.dart';

import 'package:meatApp/models/meal.dart';
import '../widgets/meal_Item.dart';

class CatigoryRecipe extends StatefulWidget {
  static final routeName = '/category-meals';
  final List<Meal> updatedMeals;
  CatigoryRecipe(this.updatedMeals);
  @override
  _CatigoryRecipeState createState() => _CatigoryRecipeState();
}

class _CatigoryRecipeState extends State<CatigoryRecipe> {
  String title;
  List<Meal> cat;
  var changed = false;
  @override
  void initState() {
    // ...........
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // this function like initState but that call much time when the satet change
    if (!changed) {
      final routesArgus =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routesArgus['title'];
      final String id = routesArgus['id'];
      cat = widget.updatedMeals
          .where((element) => element.categories.contains(id))
          .toList();
      changed = true;
    }
    super.didChangeDependencies();
  }

  // void _removeItem(String id) {
  //   setState(() {
  //     cat.removeWhere((element) => element.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).textTheme.headline2.backgroundColor,
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (crx, index) {
          return MealItem(
            id: cat[index].id,
            affordability: cat[index].affordability,
            complexity: cat[index].complexity,
            duration: cat[index].duration,
            imageUrl: cat[index].imageUrl,
            categories: cat[index].categories,
            title: cat[index].title,
            // removeItem: _removeItem,
          );
        },
        itemCount: cat.length,
      ),
    );
  }
}
