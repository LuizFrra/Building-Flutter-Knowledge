import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 65.0,
          width: 60.0,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(Icons.search, color: Colors.black),
          ),
        ),
        Container(
          height: 65.0,
          width: 60.0,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(Icons.shopping_basket, color: Colors.black),
          ),
        ),
        Container(
          height: 65.0,
          width: 120.0,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF1C1428)),
          child: Center(
              child: Text('Checkout',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white, fontSize: 15.0))),
        )
      ],
    );
  }
}
