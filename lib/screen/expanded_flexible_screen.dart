import 'package:flutter/material.dart';

class ExpandedFlexibleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Expanded Flexible'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expand(),
                  Flexy(),
                ],
              ),
              Row(
                children: [
                  Expand(),
                  Expand(),
                ],
              ),
              Row(
                children: [
                  Flexy(),
                  Expand(),
                ],
              ),
              Row(
                children: [
                  Flexy(),
                  Flexy(),
                ],
              ),
            ],
          ),
        ));
  }
}

class Expand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.green,
          child: Text('Expand')),
    );
  }
}

class Flexy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(20.0),
        child: Text("Flexy"),
      ),
    );
  }
}
