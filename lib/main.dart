import 'package:flutter/material.dart';

//Started on 2nd May 2021 at 12:43 AM
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('I AM RICH'),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Image(image: AssetImage('images/download.jpg')),
        ),
      ),
    ),
  );
}
