import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.affordability,
      @required this.complexity});

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    width: 400,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 26),
                  softWrap: true,//textDirection: TextDirection.ltr,

                  overflow: TextOverflow.fade,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
