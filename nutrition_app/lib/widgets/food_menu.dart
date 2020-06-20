import 'package:flutter/material.dart';
import 'package:nutritionapp/widgets/bottom_bar.dart';
import 'package:nutritionapp/widgets/food_item.dart';
import 'package:nutritionapp/widgets/food_item_details.dart';
import 'package:nutritionapp/widgets/food_menu_tittle.dart';

import 'nav_bar.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyNavBar(),
        FoodMenuTitle(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))),
          height: MediaQuery.of(context).size.height - 163,
          child: ListView(
            primary: false,
            padding: EdgeInsets.only(left: 25.0, right: 20.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 285,
                  child: ListView(
                    children: <Widget>[
                      FoodItem(
                          'assets/images/plate1.png', 'Salmon Bow', '\$24.00'),
                      FoodItem(
                          'assets/images/plate2.png', 'Spring Bow', '\$24.00'),
                      FoodItem(
                          'assets/images/plate3.png', 'Avocado Bow', '\$24.00'),
                      FoodItem(
                          'assets/images/plate4.png', 'Berry Bow', '\$24.00'),
                      FoodItem(
                          'assets/images/plate5.png', 'Light Bow', '\$24.00'),
                      FoodItem(
                          'assets/images/plate6.png', 'Fit Bow', '\$24.00'),
                    ],
                  ),
                ),
              ),
              BottomBar()
            ],
          ),
        )
      ],
    );
  }
}
