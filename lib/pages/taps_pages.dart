import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../pages/categories_page.dart';
import '../pages/favoite_pages.dart';

class TapsPage extends StatefulWidget {
  @override
  _TapsPageState createState() => _TapsPageState();
}

class _TapsPageState extends State<TapsPage> {
  final List<Map<String, Object>> widgets = [
    {
      'body': Categories(),
      'title': 'categories',
    },
    {
      'body': Favorite(),
      'title': 'favorites',
    }
  ];

  int currentIndex = 0;

  void slectedWidget(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgets[currentIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: widgets[currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: slectedWidget,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

/*
DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Categories(),
            Favorite(),
          ],
        ),
      ),
    );

 */
