import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double height;

  MAppBar({Key key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("DoGifs", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
      backgroundColor: Color.fromRGBO(36, 36, 36, 1.0),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(Icons.favorite, color: Colors.red,),
            iconSize: 24.0,
            padding: const EdgeInsets.all(0.0),
            onPressed: () => {
              print("Exibir Lista de Gifs Favoritos.")
            },
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
