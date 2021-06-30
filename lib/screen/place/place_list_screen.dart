import 'package:flutter/material.dart';
import 'package:first_app/model/tourism_place.dart';
import 'package:first_app/data/tourism_place.dart';
import 'package:first_app/screen/place/place_detail_screen.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Wisata Bandung'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return PlaceList();
          } else if (constraints.maxWidth < 900) {
            return PlaceGrid(gridCount: 2);
          } else {
            return PlaceGrid(gridCount: 4);
          }
        }),
      ),
    );
  }
}

class PlaceItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PlaceItem(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(image),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    Text(description, style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceItemGrid extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PlaceItemGrid(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(description, style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlaceDetailScreen(place: place);
            }));
          },
          child: PlaceItem(
            image: place.imageAsset,
            title: place.name,
            description: place.location,
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

class PlaceGrid extends StatelessWidget {
  final int gridCount;
  PlaceGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      children: List<Widget>.generate(tourismPlaceList.length, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlaceDetailScreen(place: tourismPlaceList[index]);
            }));
          },
          child: PlaceItemGrid(
            image: tourismPlaceList[index].imageAsset,
            title: tourismPlaceList[index].name,
            description: tourismPlaceList[index].location,
          ),
        );
      }),
    );
  }
}
