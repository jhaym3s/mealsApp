import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/FilterScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
        appBar: AppBar(),
        body:
        Container());
  }
}
