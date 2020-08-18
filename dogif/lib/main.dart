import 'package:dogif/DatabaseSetup/InitializeDB.dart';
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
        body: FutureBuilder(
          initialData: InitializeDB().doneInitialization,
          builder: (context, snapshot ) => GifListPage(),
        )
      ),
    );
  }
}

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:  100,
        color: Colors.green,
        ),
    );
  }
}

