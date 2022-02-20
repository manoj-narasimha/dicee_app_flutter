// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int diceValue = 0;

  void onRoll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      diceValue = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
              child: ListTile(
                leading:Icon(
                  Icons.casino,
                  size: 50.0,
                  ),
                title: Text(
                  'You got: $diceValue',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(88, 50),
              primary: Colors.pinkAccent,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              onRoll();
            },
            child: Text(
              'Roll',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
