import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.description),
          title: Text('Calculadora IMC'),
        ),
        body: ListView(
          children: <Widget>[calculadoraIMC()],
        ),
      ),
    );
  }
}

class IMC {
  static const String magreza = 'Magreza';
  static const String normal = 'Normal';
  static const String SobrePeso = 'Sobrepeso';
  static const String obesidade = 'Obesidade';
  static const String obesidiadeGrave = 'Obersidade Grave';
}

class calculadoraIMC extends StatefulWidget {
  @override
  calculadoraIMCState createState() {
    // TODO: implement createState
    return calculadoraIMCState();
  }
}

class validateInput extends StatelessWidget {
  String error = '';
  MaterialColor color;

  validateInput({this.error, this.color});

  Widget _getErrorFormatedText() {
    if (error == null || error.isEmpty)
      return Padding(
        padding: const EdgeInsets.all(0),
      );

    TextStyle style = TextStyle(color: color);

    return Text(
      error,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
      padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 10.0),
      child: _getErrorFormatedText(),
    ));
  }
}

class calculadoraIMCState extends State<calculadoraIMC> {
  TextEditingController _altura;
  TextEditingController _peso;
  String _alturaError;
  String _pesoError;
  String _classificacao;
  MaterialColor _colorClassificacao;
  String _resultado;
  String _resultadoError;
  MaterialColor _resultadoColor;

  @override
  void initState() {
    super.initState();
    _alturaError = '';
    _altura = TextEditingController();
    _altura.addListener(handleAlturaChange);

    _pesoError = '';
    _peso = TextEditingController();
    _peso.addListener(handlePesoChange);
  }

  handleAlturaChange() {
    print(_altura.text.length);
    if (_altura.text.length != 0) {
      if (int.tryParse(_altura.text) == null) {
        setState(() {
          _alturaError = 'Altura Inválida, Apenas Número.';
          _altura.text = '';
        });
      } else {
        setState(() {
          _alturaError = '';
        });
      }
    }
  }

  handlePesoChange() {
    print(_peso.text.length);
    if (_peso.text.length != 0) {
      if (double.tryParse(_peso.text) == null) {
        setState(() {
          _pesoError = 'Peso Inválido, Apenas Número.';
          _peso.text = '';
        });
      } else {
        setState(() {
          _pesoError = '';
        });
      }
    }
  }

  @override
  void dispose() {
    _altura.dispose();
    super.dispose();
  }

  Widget form() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Altura (CM): ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          TextFormField(
            controller: _altura,
            decoration: InputDecoration(hintText: 'Digite Sua Altura.'),
          ),
          validateInput(error: _alturaError, color: Colors.red),
          Text(
            'Peso (KG): ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          TextFormField(
            controller: _peso,
            decoration: InputDecoration(hintText: 'Digite Seu Peso.'),
          ),
          validateInput(error: _pesoError, color: Colors.red),
        ],
      ),
    );
  }

  calcularIMC() {
    if (_altura.text == null ||
        _peso.text == null ||
        int.tryParse(_altura.text) == null ||
        double.tryParse(_peso.text) == null) {
      setState(() {
        _resultadoError = 'Verifique os dados e tente novamente.';
        _resultadoColor = Colors.red;
        _classificacao = null;
        _resultado = null;
      });
      return;
    }

    setState(() {
      int altura = int.tryParse(_altura.text);
      double peso = double.tryParse(_peso.text);

      double resultado = double.tryParse(
          ((peso / (altura * altura)) * 10000).toStringAsFixed(1));
      _resultado = resultado.toStringAsFixed(1);
      _resultadoError = '';

      if (resultado < 18.5) {
        _classificacao = IMC.magreza;
      }
      if (resultado >= 18.5 && resultado <= 24.9) {
        _classificacao = IMC.normal;
      }
      if (resultado >= 25 && resultado <= 29.9) {
        _classificacao = IMC.SobrePeso;
      }
      if (resultado >= 30 && resultado <= 39.9) {
        _classificacao = IMC.obesidade;
      }
      if (resultado >= 40) {
        _classificacao = IMC.obesidiadeGrave;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          faceIcon(
            classificacao: _classificacao,
          ),
          validateInput(
            error: _resultado,
            color: _colorClassificacao,
          ),
          validateInput(
            error: _classificacao,
            color: _colorClassificacao,
          ),
          form(),
          Ink(
            decoration:
                const ShapeDecoration(color: Colors.red, shape: CircleBorder()),
            child: IconButton(
              icon: Icon(Icons.done),
              color: Colors.white,
              onPressed: () {
                calcularIMC();
              },
            ),
          ),
          validateInput(
            error: _resultadoError,
            color: _resultadoColor,
          )
        ],
      ),
    );
  }
}

class faceIcon extends StatelessWidget {
  faceIcon({this.classificacao});

  String classificacao;

  MaterialColor _getColor() {
    if (classificacao == null) return Colors.green;

    if (classificacao == IMC.magreza) {
      return Colors.yellow;
    }

    if (classificacao == IMC.normal) {
      return Colors.green;
    }

    if (classificacao == IMC.SobrePeso) {
      return Colors.brown;
    }

    if (classificacao == IMC.obesidade) {
      return Colors.orange;
    }

    if (classificacao == IMC.obesidiadeGrave) {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Icon(
        Icons.face,
        size: 150.0,
        color: _getColor(),
      ),
    );
  }
}
