import 'package:flutter/material.dart';
import './favoriteScreen.dart';
import './categoryScreen.dart';

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
        //note that the TabBarView must as much element as the number of 'Tab' in a TabBar
        
        CategoryScreen(),FavoritesScreen()
      ]),

    ));
  }
}
