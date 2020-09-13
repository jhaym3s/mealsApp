import 'package:flutter/material.dart';
import 'package:meals_app/categoryMealScreen.dart';
import 'package:meals_app/categoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.pinkAccent,
        //I just realise that this is the color that comes up when a list extent has been reached
        canvasColor: Colors.grey,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Colors.grey[900]),
          bodyText2: TextStyle(color: Colors.grey[900]),
          headline6: TextStyle(
            fontSize: 24.0,
            fontFamily: "RobotoCondensed"
          )
        ),
      ),
      home: CategoryScreen(),
      routes: {
        "/categoriesMeal": (context)=>CategoryMealScreen(),
      },
    );
  }
}


