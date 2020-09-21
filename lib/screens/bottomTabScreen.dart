import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryScreen.dart';
import 'package:meals_app/screens/favoriteScreen.dart';
import 'package:meals_app/widgets/mainDrawer.dart';

class TabScreenBottom extends StatefulWidget {
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}
class _TabScreenBottomState extends State<TabScreenBottom> {
  final List<Map<Object,Object>> pages = [
    { "pages": CategoryScreen(),
      "title": "Category",
      "actions": Drawer(child: Text("this is another one"),)
      //how to add actions to a tap bar
    },
    { "pages": FavoritesScreen(), "title": "Your Favourite"}

  ];
  int selectedPageIndex = 0;
  void selectPage(int index){
    setState(() {
      selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.category,size: 30,),title: Text("Categories"),backgroundColor: Colors.purple),
        BottomNavigationBarItem(icon: Icon(Icons.star,size: 30,),title: Text("Favourites"),backgroundColor: Colors.white54),
      ],onTap: selectPage,
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

