import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../widgets/mealsItem.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "/categoryMeals";
  // final String id;
  // final String title;
  // CategoryMealScreen(this.id,this.title);
  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context).settings.arguments as Map<Object, Object>;
    final title = routesArguments["title"];
    final id = routesArguments["id"];
    final color = routesArguments["color"];
    final categoryMeal = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                title: categoryMeal[index].title,
                imageUrl: categoryMeal[index].imageUrl,
                duration: categoryMeal[index].duration,
                affordability:categoryMeal[index].affordability,
                complexity: categoryMeal[index].complexity, id: categoryMeal[index].id, );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
