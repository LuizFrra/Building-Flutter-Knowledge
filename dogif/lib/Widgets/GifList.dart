import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:dogif/Widgets/GifWidget.dart';
import 'package:dogif/Widgets/KeepAliveDogif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GifList extends StatefulWidget {

  final appBarHeight;
  final gifListcontroller;
  final Function fetchGifs;
  final Function onTap;

  GifList({
    this.appBarHeight = 50,
    @required this.gifListcontroller,
    @required this.fetchGifs,
    this.onTap
  });

  @override
  _GifListState createState() => _GifListState();
}

class _GifListState extends State<GifList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height - widget.appBarHeight,
      child: ListView.builder(
        controller: widget.gifListcontroller,
        itemBuilder: (context, pageNumber) {
          return FutureBuilder<List<GifViewModel>>(
            future: widget.fetchGifs(1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height:
                      MediaQuery.of(context).size.height - widget.appBarHeight,
                );
              }
              if (snapshot.hasError) {
                return Container(
                  height: 200,
                  color: pageNumber % 2 == 0 ? Colors.red : Colors.blue,
                );
              } else {
                return KeepAliveDogif(
                  child: GifWidget(
                    gif: snapshot.data[0],
                    onTap: widget.onTap,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
