import 'package:flutter/material.dart';
import './dummyData.dart';
import './models/meal.dart';
import './screens/bottomTabScreen.dart';
import './screens/filterscreen.dart';
import './screens/mealDetailScreen.dart';
import './screens/categoryMealScreen.dart';
import './screens/categoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilter(Map<String,bool> filterData){
setState(() {
  filters = filterData;
  availableMeals = DUMMY_MEALS.where((meal) {
    if(filters["gluten"]&& !meal.isGlutenFree){
      return false;
    }
    if(filters["lactose"]&& !meal.isLactoseFree){
      return false;
    }if(filters["vegan"]&& !meal.isVegan){
      return false;
    }if(filters["vegetarian"]&& !meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
     });
  }
  List<Meal> favoriteMeals = [];
  void toddleFavorites(String mealId){
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex > -1) {
       setState(() {
         favoriteMeals.removeAt(existingIndex);
       });
     }
    else{
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meals) => meals.id== mealId));
      });
    }
  }
  //this is for setting the icon if it a favourite or not
    bool isMealFavorite(String mealId){
    return favoriteMeals.any((meal) => meal.id == mealId);
    }
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
        "/": (context)=> TabScreenBottom(favoriteMeals),
        CategoryMealScreen.routeName: (context)=>CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toddleFavorites,isMealFavorite),
        FilterScreen.routeName: (context)=> FilterScreen(filters,setFilter),
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


