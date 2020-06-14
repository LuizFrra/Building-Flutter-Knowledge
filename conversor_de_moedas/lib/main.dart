import 'dart:convert';
import 'dart:io';
import 'dart:wasm';

import 'package:conversordemoedas/Models/finance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'config/text_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(hintColor: Colors.orange, primaryColor: Colors.orange),
      title: 'Conversor de Moedas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '\$ Conversor \$',
            style: TextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: MyCoinsConversor(),
        ),
      ),
    );
  }
}

class MyCoinsConversor extends StatefulWidget {
  @override
  _MyCoinsConversorState createState() => _MyCoinsConversorState();
}

class _MyCoinsConversorState extends State<MyCoinsConversor> {
  double _dollar;
  double _euro;
  Future<Finance> _finance;
  TextEditingController _realController;
  TextEditingController _euroController;
  TextEditingController _dollarController;

  void handleEuro(String txt) {
    if (txt.isEmpty) txt = '0.0';

    double euro = double.tryParse(txt);
    _realController.text = (_euro * euro).toStringAsFixed(2);
    _dollarController.text = ((_euro / _dollar) * euro).toStringAsFixed(2);
  }

  void handleReal(String txt) {
    if (txt.isEmpty) txt = '0.0';

    double real = double.parse(txt);
    _euroController.text = (real/_euro).toStringAsFixed(2);
    _dollarController.text = (real/_dollar).toStringAsFixed(2);
  }

  void handleDollar(String txt) {
    if (txt.isEmpty) txt = '0.0';

    double dollar = double.parse(txt);
    _realController.text = (_dollar * dollar).toStringAsFixed(2);
    _euroController.text = ((_dollar / _euro) * dollar).toStringAsFixed(2);
  }

  Future<Finance> fetchCoins() async {
    final financeObj = await http.get('https://api.hgbrasil.com/finance');
    return Finance.fromJson(jsonDecode(financeObj.body));
  }

  @override
  void initState() {
    _realController = TextEditingController();
    _dollarController = TextEditingController();
    _euroController = TextEditingController();
    // TODO: implement initState
    _finance = fetchCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final finances = fetchCoins();
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: FutureBuilder<Finance>(
        future: _finance,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Carregando ...');
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData) {
            _dollar = snapshot.data.dollar;
            _euro = snapshot.data.euro;

            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 140,
                  width: 140,
                  margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(1000.0))),
                  child: Text(
                    '\$',
                    style: TextStyle(
                        fontSize: 100,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                buildTextField(
                    labelText: 'Reais ',
                    prefixText: 'R\$ ',
                    controller: _realController,
                    handleChange: handleReal),
                buildTextField(
                    labelText: 'Euros ',
                    prefixText: '€ ',
                    controller: _euroController,
                    handleChange: handleEuro),
                buildTextField(
                    labelText: 'Dollar ',
                    prefixText: '\$ ',
                    controller: _dollarController,
                    handleChange: handleDollar)
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget buildTextField(
      {String labelText,
      String prefixText,
      String hintText,
      TextEditingController controller,
      Function handleChange}) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: TextFormField(
        onChanged: handleChange,
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        style: TextStyles.inputCurrencyValue,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyles.labelInputStyle,
            prefixText: prefixText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            )),
      ),
    );
  }
}
