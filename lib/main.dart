import 'package:flutter/material.dart';
import 'package:payandpark/models/user.dart';
import 'package:payandpark/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:payandpark/services/auth.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<theUser>.value(
      initialData: null,
      value: Authservice().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
