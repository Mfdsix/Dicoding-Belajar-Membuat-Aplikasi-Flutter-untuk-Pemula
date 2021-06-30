import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Media Query'),
      ),
      body: Column(
        children: [
          Title(title: "Screen width is"),
          Value(value: screenWidth.toString()),
          Title(title: "Screen orientation is"),
          Value(value: screenOrientation.toString()),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.black,
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ));
  }
}

class Value extends StatelessWidget {
  final String value;
  const Value({required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          child: Center(
            child: Text(value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
        ));
  }
}
