import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(Randomnumber());
}

class Randomnumber extends StatefulWidget {
  @override
  _RandomnumberState createState() => _RandomnumberState();
}

class _RandomnumberState extends State<Randomnumber> {
  int _number = 1;
  var _word = 'SoftniqueBd';

  void _randomnumbergenerator() {
    setState(() {
      _number = Random().nextInt(100) + 1;
      _word = WordPair.random().asPascalCase.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Number Generator'),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Center(
                    child: Text(
                  'Random Number : $_number',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  'Company Name : $_word',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: _randomnumbergenerator,
          child: Icon(
            Icons.autorenew,
          ),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
