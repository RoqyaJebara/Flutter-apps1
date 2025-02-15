import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// The main function
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('fikra'),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(      
          child: Image(
            image: AssetImage('images/image1.png'),
          ),
        ),
      ),
    ),
  );
}
