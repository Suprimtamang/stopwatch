import 'dart:async';

import 'package:flutter/material.dart';

String imgSrc =
    "https://cdn.pixabay.com/photo/2013/07/13/13/17/chronograph-160753_1280.png";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _counter();
}

class _counter extends State<MyHomePage> {
  int initialtime = 0;
  var pausebutton;
  void _startcount() {
    pausebutton = Timer.periodic(Duration(seconds: 1), (Timer) {
      if (initialtime < 10) {
        setState(() {
          initialtime++;
        });
      } else {
        Timer.cancel();
      }
      ;
    });
  }

  void _resetcount() {
    setState(() {
      initialtime = 0;
    });
    pausebutton.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.large(
            child: Text('start'),
            onPressed: _startcount,
          ),
          FloatingActionButton.extended(
            label: Text('reset timer'),
            onPressed: _resetcount,
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                '$initialtime sec',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: [
              Image.network(
                imgSrc,
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
