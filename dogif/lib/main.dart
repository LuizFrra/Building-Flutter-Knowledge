import 'package:dogif/Pages/GifListPage.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

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
        body: teste(),
      ),
    );
  }
}

class teste extends StatefulWidget {
  @override
  _testeState createState() => _testeState();
}

class _testeState extends State<teste> {

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

  @override
  void dispose() {
    _left.dispose();
    _right.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    print(title);
    print(MediaQuery.of(context).size.height);
    return SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/2,
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 50,
                      color: Colors.blue,
                      child: ListView(
                        controller: _left,
                        children: <Widget>[
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                          Container(color: Colors.green, height: 40,),
                          Container(color: Colors.orange, height: 80,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 50,
                      color: Colors.red,
                      child: ListView(
                        controller: _right,
                        children: <Widget>[
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                          Container(color: Colors.orange, height: 40,),
                          Container(color: Colors.green, height: 80,),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
}
