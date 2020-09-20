import 'package:flutter/material.dart';
import '../dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/mealDetails";
  @override
  Widget build(BuildContext context) {
    final routesArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id== routesArguments["id"]);
    final title = routesArguments["title"];
    final id = routesArguments["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        //just figured you can use "selectedMeal.title" in place of the title
      ),
      body: Column(
        children: [
          Container(
            height: 300,width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Ingredients", style: Theme.of(context).textTheme.headline6,),
          ),
          Container(
            height: 200,width: 300, child: ListView.builder(itemBuilder: (context, index) {
              return Card(child: Text(selectedMeal.ingredients[index]),);
            },itemCount: selectedMeal.ingredients.length)
          )
        ],
      ),
    );
  }
}
