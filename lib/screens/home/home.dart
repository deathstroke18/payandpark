import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payandpark/services/auth.dart';
import 'package:payandpark/screens/register.dart';
import 'package:payandpark/screens/search/search.dart';
import 'package:payandpark/screens/out/out.dart';

class Home extends StatelessWidget {

  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.orange[900],
        title: Text("Pay & Park", style: TextStyle(color: Colors.white, fontSize: 30),),
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(

              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
              style: ElevatedButton.styleFrom(
                primary:Colors.orange[500],
              ),

          ),


        ],
      ),
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

                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  String tim = Timestamp.now().toDate().toString();
                                  var part = tim.split(" ");
                                  var year = part[0].trim();
                                    print(year);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => FormScreen()),);
                                },

                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue[600]
                                  ),

                                  child: Center(
                                    child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => parkout()),);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.brown[700]
                                  ),
                                  child: Center(
                                    child: Text("Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60,),
                        Row(

                          children: [
                            Expanded(
                            child:InkWell(
                              onTap: () {
                                print("total clicked");
                              },
                              child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.brown[700]
                              ),
                              child: Center(
                                child: Text("Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                              ),
                          ),
                            ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  print("search clicked");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => search()),);
                                },
                                child: Container(
                                  height: 60,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue[600]
                                  ),
                                  child: Center(
                                    child: Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                                  ),
                                ),
                              ),
                            ),
                        ]
                        ),
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
