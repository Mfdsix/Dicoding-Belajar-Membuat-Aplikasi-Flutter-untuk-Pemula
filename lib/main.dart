import 'package:flutter/material.dart';
import 'package:first_app/detail_screen.dart';
import 'package:first_app/list_screen.dart';
import 'package:first_app/list_builder_screen.dart';
import 'package:first_app/list_separator_screen.dart';
import 'package:first_app/expanded_screen.dart';
import 'package:first_app/expanded_flexible_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Fluta Wave',
      theme: ThemeData(),
      home: ExpandedFlexibleScreen(),
    );
  }
}
