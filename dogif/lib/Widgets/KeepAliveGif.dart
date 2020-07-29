import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class KeepAliveGif extends StatefulWidget {

  final gif;
  final int listId;

  KeepAliveGif(this.gif, this.listId);

  @override
  _KeepAliveGifState createState() => _KeepAliveGifState();
}

class _KeepAliveGifState extends State<KeepAliveGif> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://media1.giphy.com/media/" + widget
        .gif.id + "/giphy-downsized_s.gif?rid=giphy-downsized_s.gif";
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => Padding(
        padding: EdgeInsets.only(top: 24, left: 4, right: 4),
        child: Container(
          height: widget.listId % 2 == 0 ? 250 : 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              )
            ]
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
