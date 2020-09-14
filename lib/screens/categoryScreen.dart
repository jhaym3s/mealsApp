import 'package:flutter/material.dart';
import 'file:///C:/Users/jhaym/AndroidStudioProjects/meals_app/lib/widgets/categoryItem.dart';
import '../dummyData.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food app where I go use all the colors"),
      ),
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20
      ),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id,e.title, e.color)).toList(),
        padding: EdgeInsets.all(25),
      ),
    );
  }
}
