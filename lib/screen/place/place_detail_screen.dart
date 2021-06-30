import 'package:flutter/material.dart';
import 'package:first_app/model/tourism_place.dart';

var oxygenFont = TextStyle(
  fontFamily: 'Oxygen',
  color: Colors.white,
);
var oxygenFontBlack = TextStyle(
  fontFamily: 'Oxygen',
  color: Colors.black,
);

class PlaceDetailScreen extends StatelessWidget {
  final TourismPlace place;
  const PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return MobileView(place: place);
      } else {
        return DesktopView(place: place);
      }
    });
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButton createState() => _FavoriteButton();
}

class _FavoriteButton extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class MobileView extends StatelessWidget {
  final TourismPlace place;
  const MobileView({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: PlaceInfo(place: place),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(place.description,
                    textAlign: TextAlign.center, style: oxygenFont),
              ),
              ImageSlider(place: place),
            ],
          ),
        ),
      ),
    ));
  }
}

class ImageSlider extends StatelessWidget {
  final TourismPlace place;
  const ImageSlider({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(place.imageUrls[index]),
            ),
          );
        },
        itemCount: place.imageUrls.length,
      ),
    );
  }
}

class PlaceInfo extends StatelessWidget {
  final TourismPlace place;
  const PlaceInfo({required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.calendar_today, color: Colors.white),
            Text(place.openDays,
                textAlign: TextAlign.center, style: oxygenFont),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.white),
            Text(place.openTime,
                textAlign: TextAlign.center, style: oxygenFont),
          ],
        ),
        Column(
          children: [
            Icon(Icons.monetization_on, color: Colors.white),
            Text(place.ticketPrice,
                textAlign: TextAlign.center, style: oxygenFont),
          ],
        ),
      ],
    );
  }
}

class DesktopView extends StatelessWidget {
  final TourismPlace place;
  const DesktopView({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(place.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(place.imageAsset),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 150,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        child: Text(
                          place.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Staatliches',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Icon(Icons.calendar_today),
                              SizedBox(width: 8.0),
                              Text(
                                place.openDays,
                                style: oxygenFontBlack,
                              ),
                            ],
                          ),
                          FavoriteButton(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          SizedBox(width: 8.0),
                          Text(
                            place.openTime,
                            style: oxygenFontBlack,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(width: 8.0),
                          Text(
                            place.ticketPrice,
                            style: oxygenFontBlack,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          place.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
