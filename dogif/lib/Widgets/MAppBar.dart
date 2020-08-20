import 'package:dogif/Pages/GifListPage.dart';
import 'package:dogif/ViewModels/ListFavoriteGifsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double height;
  List<Widget> actions;
  MAppBar({Key key, @required this.height, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "DoGifs",
        style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
      backgroundColor: Color.fromRGBO(36, 36, 36, 1.0),
      centerTitle: true,
      actions: actions
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
