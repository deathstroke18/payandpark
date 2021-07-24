import 'package:flutter/material.dart';
import 'package:payandpark/models/park.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String tim = Timestamp.now().toDate().toString();
var part = tim.split("-");
var year = part[0].trim();
var mon = part[0].trim();
var dpart = tim.split(" ");
var day = dpart[0].trim();

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
              radius: 45.0,
              child: park.rate<=25 ? Image.asset('assets/images/bike2.png') : Image.asset('assets/images/car5.png')
            ),
            title: Text(park.name),
            subtitle: Text('Vehicle no: ${park.vno} | Phone no: ${park.pno}'),

          ),
        ),
    );
  }
}
