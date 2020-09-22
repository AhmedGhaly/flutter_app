import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import '../pages/categories_recipiy.dart';

class CategoryData extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  void switchPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CatigoryRecipe.routeName,
      arguments: {
        'title': title,
        'id': id,
      },
    );
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (context) => CatigoryRecipe(title),
    //   ),
    // );
  }

  CategoryData(this.color, this.title, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => switchPage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container( 
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        decoration: BoxDecoration(
          // color: color,
          gradient: LinearGradient(
            colors: [color.withOpacity(.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
