import 'package:flutter/material.dart';
import 'file:///C:/Users/jhaym/AndroidStudioProjects/meals_app/lib/screens/categoryMealScreen.dart';

class CategoryItem extends StatelessWidget {
  String title;
  Color color;
  String id;
  CategoryItem(this.id,this.title, this.color);
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
     CategoryMealScreen.routeName,arguments: {"id": id,"title":title,"color":color}
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
          child: Text(title,style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(gradient: LinearGradient
          (colors: [color.withOpacity(0.7),color],begin: Alignment.topLeft,end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
