import 'package:flutter/material.dart';
import 'package:payandpark/services/database.dart';
import 'package:provider/provider.dart';
import 'package:payandpark/screens/search/park_list.dart';
import 'package:payandpark/models/park.dart';

class search extends StatefulWidget {


  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Park>>.value(
      initialData: null,
      value: DatabaseService().parks,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Search'),
        ),
        body: ParkList(),
      ),
    );
  }
}
