import 'package:flutter/material.dart';
import 'package:payandpark/models/park.dart';

class ParkTile extends StatelessWidget {

  final Park park;
  ParkTile({ this.park });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.8),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage("assets/car2.png"),
            ),
            title: Text(park.name),
            subtitle: Text(park.pno),
          ),
        ),
    );
  }
}
