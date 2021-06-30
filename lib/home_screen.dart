import 'package:flutter/material.dart';
import 'package:first_app/detail_screen.dart';
import 'package:first_app/list_screen.dart';
import 'package:first_app/list_builder_screen.dart';
import 'package:first_app/list_separator_screen.dart';
import 'package:first_app/expanded_screen.dart';
import 'package:first_app/expanded_flexible_screen.dart';
import 'package:first_app/send_data_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            NavigatorButton(
                title: "Detail Screen", destination: DetailScreen()),
            NavigatorButton(
                title: "List View Screen", destination: ListScreen()),
            NavigatorButton(
                title: "List View Builder Screen",
                destination: ListBuilderScreen()),
            NavigatorButton(
                title: "List View Separated Screen",
                destination: ListSeparatorScreen()),
            NavigatorButton(
                title: "Expanded Screen", destination: ExpandedScreen()),
            NavigatorButton(
                title: "Expanded Flexible Screen",
                destination: ExpandedFlexibleScreen()),
            NavigatorButton(
                title: "Send Message Screen",
                destination:
                    SendDataScreen(message: "message from home screen")),
          ],
        ),
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  final String title;
  final Widget destination;

  const NavigatorButton({required this.title, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: OutlinedButton(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Text(title),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return destination;
          }));
        },
      ),
    );
  }
}
