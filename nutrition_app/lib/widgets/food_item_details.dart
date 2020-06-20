import 'package:flutter/material.dart';
import 'package:nutritionapp/widgets/nav_bar.dart';


class FoodItemDetails extends StatefulWidget {
  final foodName;
  final imgPath;
  final foodPrice;

  FoodItemDetails(this.imgPath, this.foodName, this.foodPrice);

  @override
  _FoodItemDetailsState createState() => _FoodItemDetailsState();
}

class _FoodItemDetailsState extends State<FoodItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0XFF21BFBD),
      child: GestureDetector(
        onTap: () {
          print('k');
          Navigator.of(context).pop();
        },
        child: Container(
          color: Color(0XFF21BFBD),
          child: MyNavBar(),
        ),
      ),
    );
  }
}
