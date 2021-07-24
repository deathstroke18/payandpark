import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payandpark/services/sparams.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:payandpark/models/park.dart';
//extract year
String tim = Timestamp.now().toDate().toString();
var part = tim.split("-");
var year = part[0].trim();
var mon = part[0].trim();
var dpart = tim.split(" ");
var day = dpart[0].trim();
String poop;

class DatabaseService {



  final String uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference parkCollection = FirebaseFirestore.instance.collection(year);
  final CollectionReference notParked = FirebaseFirestore.instance.collection('notparked');

  Future updateUserData( String name, String vno, String pno, int rate ,String tim, bool parked) async {
     poop = parkCollection.doc().id;

     //dynamic result = await scanner.generateBarCode(poop);
     //print(result);
    return await parkCollection.doc(poop).set({
      'name': name,
       'vno': vno,
       'pno': pno,
       'rate': rate,
        'tim': tim,
        'parked' : parked,
        'vnoSearch' : setSearchParam(vno),


    });
  }

  Future notParkedUserData( String name, String vno, String pno, int rate ,String tim, bool parked, var p) async {

    return await notParked.doc(p).set({
      'name': name,
      'vno': vno,
      'pno': pno,
      'rate': rate,
      'tim': tim,
      'parked': parked,
    });
  }
  // park list from snapshot
  List<Park> _parkListFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.docs.map((doc){
          return Park(
            name: doc.data()['name'] ?? '',
            vno: doc.data()['vno'] ?? '0',
            pno: doc.data()['pno'] ?? '0',
            rate: doc.data()['rate'] ?? 0,
          );
      }).toList();
  }


// get parked streams
 Stream<List<Park>> get parks {
    return parkCollection.snapshots()
    .map(_parkListFromSnapshot);
 }
}

