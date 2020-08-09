import 'package:flutter/material.dart';

class FavHeartButton extends StatefulWidget {

  final Function onTap;

  final bool isFav;

  FavHeartButton({this.onTap, this.isFav});

  @override
  _FavHeartButtonState createState() => _FavHeartButtonState();
}

class _FavHeartButtonState extends State<FavHeartButton> {

  bool isFav = false;

  @override
  void initState() {
    // TODO: implement initState
    isFav = widget.isFav;
    super.initState();
  }

  Function addToFav() {
    widget.onTap();
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0x000000).withOpacity(0),
      child: Ink(
        decoration: ShapeDecoration(
            color: Color.fromRGBO(39, 39, 39, 1.0),
            shape: CircleBorder()
        ),
        child: IconButton(
          iconSize: 38.0,
          icon: Icon(Icons.favorite),
          color: isFav ? Colors.red : Colors.white,
          onPressed: () => addToFav(),
        ),
      ),
    );
  }
}

