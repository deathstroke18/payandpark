import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payandpark/services/database.dart';

Widget build(BuildContext context) {
  var p = '5qdp0IZCEU0etW6fMBpa';
  return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection(year).doc(p).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading...");
        }
        var userDocument = snapshot.data;
        return new Text(userDocument["name"]);
      }
  );
}