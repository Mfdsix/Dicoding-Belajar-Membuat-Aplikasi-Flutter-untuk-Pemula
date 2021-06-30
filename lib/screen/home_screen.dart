import 'package:flutter/material.dart';
import 'package:first_app/screen/detail_screen.dart';
import 'package:first_app/screen/list_screen.dart';
import 'package:first_app/screen/list_builder_screen.dart';
import 'package:first_app/screen/list_separator_screen.dart';
import 'package:first_app/screen/expanded_screen.dart';
import 'package:first_app/screen/expanded_flexible_screen.dart';
import 'package:first_app/screen/send_data_screen.dart';
import 'package:first_app/screen/media_query_screen.dart';
import 'package:first_app/screen/layout_builder_screen.dart';
import 'package:first_app/screen/responsive_screen.dart';
import 'package:first_app/screen/place/place_list_screen.dart';

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
            Title(title: "Basic"),
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
            NavigatorButton(
                title: "Media Query Screen", destination: MediaQueryScreen()),
            NavigatorButton(
                title: "Layout Builder Screen",
                destination: LayoutBuilderScreen()),
            NavigatorButton(
                title: "Responsive Screen", destination: ResponsiveScreen()),
            Title(title: "Implementation"),
            NavigatorButton(
                title: "Detail Screen", destination: DetailScreen()),
            NavigatorButton(
                title: "Places Screen", destination: PlaceListScreen()),
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

class Title extends StatelessWidget {
  final String title;
  const Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          Divider(),
        ],
      ),
    );
  }
}
