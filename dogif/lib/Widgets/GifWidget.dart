import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GifWidget extends StatefulWidget {

  GifViewModel gif;
  Key key;

  GifWidget({this.gif, this.key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<GifWidget> {
  @override
  Widget build(BuildContext context) {
    double height = widget.gif.heightDownsizedStill.toDouble();
    return CachedNetworkImage(
      imageUrl: widget.gif.sourceDownsizedStill,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => Padding(
        padding: EdgeInsets.only(top: 24, left: 4, right: 4),
        child: Container(
          height: widget.gif.heightDownsizedStill < 250 ? height : 250,
          decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                )
              ]),
        ),
      ),
    );
  }
}
