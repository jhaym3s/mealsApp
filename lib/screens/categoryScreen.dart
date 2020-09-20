import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../dummyData.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20
      ),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id,e.title, e.color)).toList(),
        padding: EdgeInsets.all(25),

    );
  }
}
