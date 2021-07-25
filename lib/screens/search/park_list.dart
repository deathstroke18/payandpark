import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:payandpark/models/park.dart';
import 'package:payandpark/screens/search/park_tile.dart';

class ParkList extends StatefulWidget {
  const ParkList({Key key}) : super(key: key);

  @override
  _ParkListState createState() => _ParkListState();
}

class _ParkListState extends State<ParkList> {
  @override
  Widget build(BuildContext context) {

    final parks = Provider.of<List<Park>>(context) ?? [];
    //print(parks.docs);
    parks.forEach((park) {
      //print(park.name);
      //print(park.vno);
      //print(park.pno);
      //print(park.rate);
    });
    return ListView.builder(
        itemCount: parks.length,
        itemBuilder: (context, index) {
          return ParkTile(park: parks[index]);
        },
    );
  }
}
