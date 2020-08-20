import 'package:dogif/DatabaseSetup/InitializeDB.dart';
import 'package:dogif/Pages/GifListPage.dart';
import 'package:dogif/Widgets/FavoriteListIcon.dart';
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
          actions: <Widget>[
            FavoriteListIcon()
          ],
        ),
        backgroundColor: Color.fromRGBO(39, 39, 39, 1.0),
        body: FutureBuilder(
          future: InitializeDB().doneInitialization,
          builder: (context, snapshot ) {
            if(snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GifListPage();
            }
          },
        )
      ),
    );
  }
}

