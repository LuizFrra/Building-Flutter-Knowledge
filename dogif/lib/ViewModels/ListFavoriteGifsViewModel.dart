import 'package:dogif/Widgets/MAppBar.dart';
import 'package:flutter/material.dart';

class ListFavoriteGifsViewModel extends StatefulWidget {
  @override
  _ListFavoriteGifsViewModelState createState() => _ListFavoriteGifsViewModelState();
}

class _ListFavoriteGifsViewModelState extends State<ListFavoriteGifsViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(height: 50,),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
