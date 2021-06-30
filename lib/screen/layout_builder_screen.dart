import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Layout Builder'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Title(title: "Media Query Width"),
                  Value(value: mediaQueryWidth.toStringAsFixed(2)),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints contstaints) {
                return Row(
                  children: [
                    Title(title: "Layout Builder Width"),
                    Value(value: contstaints.maxWidth.toStringAsFixed(2)),
                  ],
                );
              }),
            ),
          ],
        ),
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
      child: Center(
        child: Text(title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
      ),
    );
  }
}

class Value extends StatelessWidget {
  final String value;
  const Value({required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(value,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }
}
