import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/mealsItem.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals ;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
     if(favoriteMeals.isEmpty){ return Container(
      child: Center( child: Text("Text"),
      ),
     );
     }
     else ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(

          // I really don't know why removeItem without linking it to an anon function is working
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          affordability:favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity, id: favoriteMeals[index].id, );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
