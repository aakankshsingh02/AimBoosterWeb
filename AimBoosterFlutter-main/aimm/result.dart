import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int hits;
  final int misses;


  ResultPage({this.hits = 0, this.misses = 0});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int counter = 0;
  bool create = true;
  @override
  Widget build(BuildContext context) {
    if(create) {
      Timer.periodic(Duration(seconds: 1), (t) async {
        setState(() {
          print(t.tick);
          counter = t.tick;
        });
        if (t.tick == 4) {
          t.cancel();
          Navigator.pop(context);
        }
      });
      create = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score is : ${widget.hits * 200 - widget.misses * 50}',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'You will redirect to main menu in ${4 - counter} seconds',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
