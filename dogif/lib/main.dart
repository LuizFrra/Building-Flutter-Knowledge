import 'package:dogif/Pages/GifListPage.dart';
import 'package:flutter/material.dart';

import 'Widgets/MAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DoGif",
      home: Scaffold(
        appBar: MAppBar(
          height: 50,
        ),
        backgroundColor: Color.fromRGBO(39, 39, 39, 1.0),
        body: GifListPage(),
      ),
    );
  }
}

class teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(

      ),
    );
  }
}

