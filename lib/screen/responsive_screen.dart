import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Responsive Screen"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return ListView(
            children: boxItems(),
          );
        } else if (constraints.maxWidth < 800) {
          return GridView.count(
            crossAxisCount: 2,
            children: boxItems(),
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            children: boxItems(),
          );
        }
      }),
    );
  }
}

List<Widget> boxItems() {
  return List<Widget>.generate(20, (index) {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.blueGrey,
      height: 200,
    );
  });
}
