import 'package:flutter/material.dart';

class ListSeparatorScreen extends StatelessWidget {
  final List<String> layers = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Separated')),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 250,
              child: Center(
                child: Text('${layers[index]}', style: TextStyle(fontSize: 50)),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
              thickness: 3,
            );
          },
          itemCount: layers.length),
    );
  }
}
