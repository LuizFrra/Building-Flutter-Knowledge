import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class KeepAliveDogif extends StatefulWidget {

  final child;
  Key key;

  KeepAliveDogif({this.child, this.key}) : super(key: key);

  @override
  _KeepAliveGifState createState() => _KeepAliveGifState();
}

class _KeepAliveGifState extends State<KeepAliveDogif> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
