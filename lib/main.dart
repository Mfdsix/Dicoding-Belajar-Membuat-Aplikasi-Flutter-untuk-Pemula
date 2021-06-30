import 'package:flutter/material.dart';
import 'package:first_app/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Fluta Wave',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
