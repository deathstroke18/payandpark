import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payandpark/services/database.dart';
import 'package:provider/provider.dart';
import 'package:payandpark/screens/register.dart' as reg;
import 'package:payandpark/models/park.dart';

class parkOut extends StatefulWidget {
  const parkOut({Key key, this.park}) : super(key: key);
  final Park park;

  @override
  _parkOutState createState() => _parkOutState();
}

class _parkOutState extends State<parkOut> {

  @override
  Widget build(BuildContext context) {
    final parks = Provider.of<List<Park>>(context) ?? [];
    return StreamProvider<List<Park>>.value(
      initialData: null,
      value: DatabaseService().parks,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text('Park Out'),
        ),
        body:
        Text('${widget.park.name}'),
      ),
    );
  }
}

