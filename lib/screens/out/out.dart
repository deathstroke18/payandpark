import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payandpark/services/database.dart';
import 'package:payandpark/screens/register.dart' as reg;

var p = '5qdp0IZCEU0etW6fMBpa';
bool parked= reg.parked;

class parkout extends StatefulWidget {
  const parkout({Key key}) : super(key: key);

  @override
  _parkoutState createState() => _parkoutState();
}

class _parkoutState extends State<parkout> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[700],
          title: Text('Out'),
        ),
        body:Container(


        )
      );


  }
}


























  // return new StreamBuilder(
  //     stream: FirebaseFirestore.instance.collection(year).doc(p).snapshots(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return new Text("Loading...");
  //       }
  //       var userDocument = snapshot.data;
  //       return new Text(userDocument["name"]);
  //     }
  // );
