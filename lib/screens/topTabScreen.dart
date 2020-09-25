import 'package:flutter/material.dart';
import './favoriteScreen.dart';
import './categoryScreen.dart';
import '../models/meal.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favorite ;
  TabsScreen(this.favorite);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text("Eti's App"),bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.category,),text: 'Category',),
        Tab(icon: Icon(Icons.star,),text: 'Favourites',),
      ]),
      ),
      body: TabBarView(children: [
        //note that the TabBarView must as much element as the number of 'Tab' in a TabBar
        
        CategoryScreen(),FavoritesScreen(widget.favorite)
      ]),

    ));
  }
}
//so if you want to implement this guy make it the default widget in the main.dart file
