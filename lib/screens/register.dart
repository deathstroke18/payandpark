import 'package:flutter/material.dart';
import 'package:payandpark/services/database.dart';
import 'package:provider/provider.dart';
import 'package:payandpark/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:payandpark/services/print.dart';
import 'package:payandpark/services/database.dart';

Timestamp tim = Timestamp.now();
bool parked = true;

class FormScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return FormScreenState();
  }
}

final _textController = TextEditingController();
final _textController1 = TextEditingController();
final _textController2= TextEditingController();


class FormScreenState extends State<FormScreen> {
  String name;
  String vno;
  String _phoneNumber;

  int val = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {


    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 15,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildvno() {
    return TextFormField(
      controller: _textController1,
      decoration: InputDecoration(labelText: 'Vehicle no'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Vehicle no is Required';
        }


        return null;
      },
      onSaved: (String value) {
        vno = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _textController2,
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }
  Widget _buildrate() {
    return Row(children: [
      Radio(
        value: 25,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            val = 25;
          });
        },
      ),

      Text("25"),
      SizedBox(width: 10,),
      Radio(
        value: 50,
        groupValue: val,
        onChanged: (value) {
            setState(() {
              val = 50;
            });
        },
      ),

      Text("50"),
      SizedBox(width: 10,),
      Radio(
        value: 70,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            val = 70;
          });
        },
      ),
      Text("70"),
      SizedBox(width: 10,),
      Radio(
        value: 120,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            val = 120;
          });
        },
      ),
      Text("120"),
      SizedBox(width: 10,),
    ],);

  }



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<theUser>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Colors.orange[900],
          title: Text("Register")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildvno(),
                _buildPhoneNumber(),
                _buildrate(),

                SizedBox(height: 50),
                ElevatedButton(
                  child: const Text('submit',
                  style: TextStyle( fontSize: 30) ),
                  style: ElevatedButton.styleFrom(
                    primary:Colors.orange[500],
                    minimumSize: Size(120,60),
                  ),
                  onPressed: () async{

                    _formKey.currentState.save();
                      await DatabaseService(uid: user.uid).updateUserData(name, vno, _phoneNumber, val , tim, parked);


                    this.setState(() {
                      _textController.clear();
                      _textController1.clear();
                      _textController2.clear();
                      val=0;
                    });
                      //_generateBarCode(poop);


                    //qr stuff


                              //qr stuff end
                    //print(name);
                    //print(vno);
                    //print(_phoneNumber);
                    //print(_phoneNumber);



                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}