import 'package:flutter/material.dart';

var oxygenFont = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Detail'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/farm-house.jpg'),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "FARM HOUSE LEMBANG",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_today),
                      Text("Open Everyday",
                          textAlign: TextAlign.center, style: oxygenFont),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.timer),
                      Text("09:00 - 20:00",
                          textAlign: TextAlign.center, style: oxygenFont),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      Text("Rp 25.000",
                          textAlign: TextAlign.center, style: oxygenFont),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                  'some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description',
                  textAlign: TextAlign.center,
                  style: oxygenFont),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 150,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                  ),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
