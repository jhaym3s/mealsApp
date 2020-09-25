import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/categoryScreen.dart';
import '../screens/favoriteScreen.dart';
import '../widgets/mainDrawer.dart';

class TabScreenBottom extends StatefulWidget {
  final List<Meal> favorites;
  TabScreenBottom(this.favorites);
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}

class _TabScreenBottomState extends State<TabScreenBottom> {
  List<Map<Object, Object>> pages;

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
@override
  void initState() {
  pages = [
    {
      "pages": CategoryScreen(),
      "title": "Category",
      "actions": Drawer(
        child: Text("this is another one"),
      )
      //how to add actions to a tap bar
    },
    {"pages": FavoritesScreen(widget.favorites), "title": "Your Favourite"}
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 30,
              ),
              title: Text("Categories"),
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              title: Text("Favourites"),
              backgroundColor: Colors.white54),
        ],
        onTap: selectPage,
        selectedItemColor: Colors.white54,
        unselectedItemColor: Colors.black54,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      ),
      //drawer: pages[selectedPageIndex]["actions"],
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
        //  actions: [pages[selectedPageIndex]["actions"]],
        // so this is not working
      ),
      body: pages[selectedPageIndex]["pages"],
    );
  }
}
