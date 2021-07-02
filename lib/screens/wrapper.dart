import 'package:flutter/material.dart';
import 'package:payandpark/models/user.dart';
import 'package:payandpark/screens/authenticate/authenticate.dart';
import 'package:payandpark/screens/home/home.dart';
import 'package:payandpark/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:payandpark/screens/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<theUser>(context);
    print(user);
    //return either home or authenticate
    if (user == null ) {
      return Authenticate();
    } else {
      return Home();

    }
  }
}
