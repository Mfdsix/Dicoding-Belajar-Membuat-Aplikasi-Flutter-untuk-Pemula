import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Screen'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
              child: Container(
            color: Colors.blue,
          )),
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          Expanded(
              child: Container(
            color: Colors.yellow,
          )),
        ],
      ),
    );
  }
}
