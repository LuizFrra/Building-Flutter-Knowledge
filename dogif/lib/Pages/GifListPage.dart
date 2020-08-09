import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:dogif/ViewModels/ListGifViewModel.dart';
import 'package:dogif/Widgets/FullGif.dart';
import 'package:dogif/Widgets/GifList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class GifListPage extends StatefulWidget {
  ListGifViewModel _listGifViewModel = new ListGifViewModel();

  @override
  _GifListPageState createState() => _GifListPageState();
}

class _GifListPageState extends State<GifListPage> {
  LinkedScrollControllerGroup _controllers;
  ScrollController _left;
  ScrollController _right;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _left = _controllers.addAndGet();
    _right = _controllers.addAndGet();
  }

  VoidCallback openGif(GifViewModel gif) {
    showDialog(
        context: context,
        builder: (context) {
          return FullGif(gif, widget._listGifViewModel.addToFavorite);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GifList(
            gifListcontroller: _left,
            fetchGifs: widget._listGifViewModel.fetchGifs,
            onTap: openGif,
          ),
          GifList(
            gifListcontroller: _right,
            fetchGifs: widget._listGifViewModel.fetchGifs,
            onTap: openGif,
          )
        ],
      ),
    );
  }
}
