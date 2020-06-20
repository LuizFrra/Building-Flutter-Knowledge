import 'package:flutter/material.dart';

class FoodMenuTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 0,),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Row(
            children: <Widget>[
              Text('Healthy', style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              SizedBox(width: 10,),
              Text('Food', style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Montserrat',),),
              SizedBox(height: 100,)
            ],
          ),
        )
      ],
    );
  }
}
