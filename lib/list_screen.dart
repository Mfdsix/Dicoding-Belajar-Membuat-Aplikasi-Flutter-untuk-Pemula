import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<String> layers = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: ListView(
          children: layers.map((layer) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              height: 250,
              child: Center(
                child: Text('$layer', style: TextStyle(fontSize: 50.0)),
              ),
            );
          }).toList(),
        ));
  }
}
