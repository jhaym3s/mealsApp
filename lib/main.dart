import 'package:flutter/material.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import './screens/categoryMealScreen.dart';
import './screens/categoryScreen.dart';

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
          ),
        ),
      ),
      //home:"/" ,//CategoryScreen(),
      routes: {
        "/": (context)=> CategoryScreen(),
        CategoryMealScreen.routeName: (context)=>CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      //the below route is like the 404 page for flutter
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
      // //the below route is reached if you are going to a named route with pushed name and the route is not registered in the main.dart file

       // ignore: missing_return
       onGenerateRoute: (settings) {
        print(settings.arguments);
      //   return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}


