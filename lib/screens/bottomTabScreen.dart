import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryScreen.dart';
import 'package:meals_app/screens/favoriteScreen.dart';

class TabScreenBottom extends StatefulWidget {
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}
class _TabScreenBottomState extends State<TabScreenBottom> {
  final List<Map<Object,Object>> pages = [
    { "pages": CategoryScreen(), "title": "Category"},
    { "pages": FavoritesScreen(), "title": "Your Favourite"}

  ];
  int selesctedPageIndex = 0;
  void selectPage(int index){
    setState(() {
      selesctedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.category,size: 30,),title: Text("Categories")),
        BottomNavigationBarItem(icon: Icon(Icons.star,size: 30,),title: Text("Favourites")),
      ],onTap: selectPage,
      selectedItemColor: Colors.white54,
        unselectedItemColor: Colors.black54,
        currentIndex: selesctedPageIndex,
      ),
      appBar: AppBar(
        title: Text(pages[selesctedPageIndex]["title"]),
      ),
      body: pages[selesctedPageIndex]["pages"],

    );
  }
}

