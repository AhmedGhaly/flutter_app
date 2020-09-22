import 'package:flutter/material.dart';

class MealDetials extends StatelessWidget {
  final String imageSrc;
  final List<String> ingred;
  final List<String> steps;
  MealDetials({
    @required this.imageSrc,
    @required this.ingred,
    @required this.steps,
  });

  Widget textContainer(String child) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        '${child}: ',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget containerList({Widget child, double h, BuildContext ctx}) {
    return Container(
      height: MediaQuery.of(ctx).size.height * h,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 5,
        ),
      ),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: double.infinity,
            child: Image.network(
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
          textContainer('ingredants'),
          containerList(
            h: .3,
            ctx: context,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        Theme.of(context).textTheme.headline2.backgroundColor,
                  ),
                  child: Text(
                    ingred[index],
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
              itemCount: ingred.length,
            ),
          ),
          textContainer('Steps'),
          containerList(
            h: .4,
            ctx: context,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading: CircleAvatar(
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    '${steps[i]}',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
              itemCount: steps.length,
            ),
          )
        ],
      ),
    );
  }
}
