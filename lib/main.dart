import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _campoUm;
  double _campoDois;
  double _total;

  TextEditingController campoUmController = new TextEditingController();
  TextEditingController campoDoisController = new TextEditingController();

  void _getInputsValues(){
    _campoUm = double.parse(campoUmController.text);
    _campoDois = double.parse(campoDoisController.text);
  }

  void _clear() {
    _getInputsValues();
    setState(() {
      _total = 0.0;
      campoUmController.text = "";
      campoDoisController.text = "";
    });

  }

  void _sum() {
    _getInputsValues();
    setState(() {
      _total = _campoUm + _campoDois;
    });

  }

  void _percentage() {
    _getInputsValues();
    setState(() {
      _total = _campoUm * _campoDois / 100;
    });

  }


  void _subtract() {
    _getInputsValues();
    setState(() {
      _total = _campoUm - _campoDois;
    });
  }

  void _multiply() {
    _getInputsValues();
    setState(() {
      _total = _campoUm * _campoDois;
    });
  }

  void _divide() {
    _getInputsValues();
    setState(() {
      _total = _campoUm / _campoDois;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(70, 67, 71, 90),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text('$_total',
                style: TextStyle(color: Colors.white,
                fontSize: 50)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: TextField(
                controller: campoUmController,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.white),
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.deepPurple, width: 1.0),
                    ),
                    hintText: 'Numero'
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: TextField(
                controller: campoDoisController,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.white),
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.deepPurple, width: 1.0),
                    ),
                    hintText: 'Numero'),
              ),
            ),
            ],
          ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  padding: EdgeInsets.symmetric(),
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  onPressed: _sum,
                  child: new Text("+"),
                ),
                new RaisedButton(
                  padding: EdgeInsets.symmetric(),
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  onPressed: _subtract,
                  child: new Text("-"),
                ),
                new RaisedButton(
                  padding: EdgeInsets.symmetric(),
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  onPressed: _percentage,
                  child: new Text("%"),
                ),
              ],
            ),
             new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                    padding: EdgeInsets.symmetric(),
                    textColor: Colors.white,
                    color: Colors.purpleAccent,
                    onPressed: _multiply,
                    child: new Text("x"),
                  ),
                  new RaisedButton(
                    padding: EdgeInsets.symmetric(),
                    textColor: Colors.white,
                    color: Colors.purpleAccent,
                    onPressed: _divide,
                    child: new Text("/"),
                  ),
                ],
              ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
          onPressed: _clear,
          child: new Icon(Icons.autorenew),
    ),
    );
  }
}
