import 'package:flutter/material.dart';

class ListBuilderScreen extends StatelessWidget {
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
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('List View Builder'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child:
                    Text('${layers[index]}', style: TextStyle(fontSize: 50.0)),
              ));
        },
        itemCount: layers.length,
      ),
    );
  }
}
