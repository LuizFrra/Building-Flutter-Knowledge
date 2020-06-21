import 'package:flutter/material.dart';
import 'package:nutritionapp/widgets/food_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFF03C3C0),
        body: Column(
          children: <Widget>[
            FoodMenu()
          ],
        ),
      ),
    );
  }
}

