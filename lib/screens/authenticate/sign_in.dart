import 'package:flutter/material.dart';
import 'package:payandpark/services/auth.dart';
import 'package:payandpark/shared/loading.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final Authservice _auth = Authservice();

  bool loading = false;

  String email1 = 'balan@123.com';
  String email2 = 'sasi@123.com';
  String password = 'asdf1234';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400],
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 0),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                )
            ),
            SizedBox(height: 10),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),

                        SizedBox(height: 160,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.signInWithEmailAndPassword(email1, password);
                                  if(result== null){
                                    setState(() {
                                      error = 'supply valid email';
                                      loading = false;
                                    });
                                    print(error);

                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                  ),
                                  child: Center(
                                    child: Text("Balan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.signInWithEmailAndPassword(email2, password);
                                  if(result== null){
                                    setState(() {
                                      error = 'supply valid email';
                                      loading = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black
                                  ),
                                  child: Center(
                                    child: Text("Sasi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),

      ),
    );
  }
}

    
    