import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text("Meals app"),bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.category,),text: 'Category',),
        Tab(icon: Icon(Icons.star,),text: 'Favourites',),
      ]),
      ),
      body: TabBarView(children: [
        CategoryScreen(),
      ]),

    ));
  }
}
