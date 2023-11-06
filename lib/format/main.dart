import 'package:flutter/material.dart';
import 'package:g_p/pages/nav.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Parked App',
      home: Nav(),   
    );
  }
}