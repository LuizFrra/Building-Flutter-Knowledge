import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Contador de Pessoas',
      home: Stack(
        children: <Widget>[
          Image.asset('images/lake.jpg', height: 1000.0, fit: BoxFit.cover,),
          contadorPessoasWidget()
        ],
      ),
    );
  }
// This widget is the root of your application.

}

class contadorPessoasWidget extends StatefulWidget {
  @override
  contadorPessoasState createState() {
    return contadorPessoasState();
  }
}

class contadorPessoasState extends State<contadorPessoasWidget> {
  int i = 0;

  VoidCallback addPerson() {
    setState(() {
      i++;
    });
    print('Adicionando Pessoas: ' + i.toString());
  }

  VoidCallback removePerson() {
    setState(() {
      i--;
    });
    print('Removendo Pessoas: ' + i.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    );
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: ' + i.toString(),
              style: textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: addPerson,
                  child: Text(
                    '+1',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(padding: EdgeInsets.all(40)),
                FlatButton(
                  onPressed: removePerson,
                  child: Text(
                    '-1',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Text(
              'Pode Entrar.',
              style: textStyle,
            )
          ],
        ));
  }
}
