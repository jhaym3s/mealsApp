import 'package:flutter/material.dart';
import '../screens/filterscreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String titleText, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          fontFamily: "RobotoCondensed",
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.deepPurpleAccent,
            child: Text(
              "What's Cooking",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          buildListTile(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
