import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/mealDetails";
  Widget headerTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget StepContainers(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54,
          gradient: LinearGradient(colors: [Colors.white54, Colors.black54]),
          borderRadius: BorderRadius.circular(15)),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal = DUMMY_MEALS
        .firstWhere((element) => element.id == routesArguments["id"]);
    final title = routesArguments["title"];
    final id = routesArguments["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        //just figured you can use "selectedMeal.title" in place of the title
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            headerTitle(context, "Ingredients"),
            StepContainers(ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0.5, horizontal: 6),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                      color: Colors.purpleAccent[100],
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length)), //Container
            headerTitle(context, "Steps"),
            StepContainers(ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(selectedMeal.steps[index]),
                );
              },itemCount: selectedMeal.steps.length,
            ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
