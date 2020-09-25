import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../widgets/mealsItem.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/categoryMeals";
    final List<Meal> availableMeals;
    CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  Color color;
  //String id;
  List<Meal> displayedMeal;
    bool loadedInitData= false;
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routesArguments =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<Object, Object>;
      title = routesArguments["title"];
      final id = routesArguments["id"];
      color = routesArguments["color"];
      displayedMeal = widget.availableMeals
          .where((element) => element.categories.contains(id))
          .toList();
      loadedInitData == true;
    }
    super.didChangeDependencies();

  }
  void removeItem(String mealId){
    setState(() {
      displayedMeal.removeWhere((element) => element.id== mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(

                // I really don't know why removeItem without linking it to an anon function is working
                title: displayedMeal[index].title,
                imageUrl: displayedMeal[index].imageUrl,
                duration: displayedMeal[index].duration,
                affordability:displayedMeal[index].affordability,
                complexity: displayedMeal[index].complexity, id: displayedMeal[index].id, );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
