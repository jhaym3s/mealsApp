import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMealScreen(this.id,this.title);
  @override
  Widget build(BuildContext context) {
    final routesArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routesArguments["title"];
    final id = routesArguments["id"];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("Recipe for the category screen"),
      ),
    );
  }
}
