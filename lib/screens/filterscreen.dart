import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/FilterScreen";
  final Function setFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.setFilters);



  @override
  _FilterScreenState createState() => _FilterScreenState();
}


class _FilterScreenState extends State<FilterScreen> {
  var glutenFree ;
  var vegetarian ;
  var vegan ;
  var lactoseFree ;


  Widget selectFoodType(
      bool spec, String title, String description, Function flip) {
    return SwitchListTile(
      value: spec,
      onChanged: flip,
      title: Text(title),
      subtitle: Text(description),
    );
  }
@override
  void initState() {
    glutenFree = widget.currentFilters["gluten"];
    vegetarian = widget.currentFilters["vegetarian"];
    vegan = widget.currentFilters["vegan"];
    lactoseFree = widget.currentFilters["lactose"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed:
                (){
              final selectedFilters = {
                "gluten": glutenFree,
                "lactose": lactoseFree,
                "vegetarian": vegetarian,
                "vegan": vegan,
                };
              widget.setFilters(selectedFilters);
            })
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection here",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
                child: ListView(
              children: [
                selectFoodType(glutenFree, "Gluten Free",
                    "All the food here are gluten ", (newValue){
                  setState(() {
                    glutenFree = newValue;
                  });
                    }),
                selectFoodType(vegetarian, "Vegetarian?",
                    "Select this if you are a vegetarian ", (newValue){
    setState(() {
    vegetarian = newValue;
    });}),
                selectFoodType(
                    vegan, "Vegan?", "Select this if you are a vegan", (newValue){
    setState(() {
    vegan = newValue;
    });}),
                selectFoodType(
                    lactoseFree,
                    "Lactose Free ",
                    "Look at your stomach if you are not proud of it on this section",
                    (newValue){
    setState(() {
    lactoseFree = newValue;
    });})
              ],
            ))
          ],
        ));
  }
}
