import 'package:firebase_auth/firebase_auth.dart';
import 'package:payandpark/models/user.dart';
class Authservice {

  final FirebaseAuth _auth = FirebaseAuth.instance;
// create user obj based on firebase user

  theUser _fromFirebaseUser(User user) {
    return user != null ? theUser(uid: user.uid) : null;

  }
  // auth change user stream
  Stream<theUser> get user {
    return _auth.authStateChanges()
        //.map((User user) => _fromFirebaseUser(user) );
    .map(_fromFirebaseUser);
  }
  //sign in anon
Future signInAnon() async {
  try{
    UserCredential result = await _auth.signInAnonymously();
    User user = result.user;
    return _fromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;

  }
}

  //sign in ph no

  //sign in  email
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _fromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;

    }
  }

 // sign out

 Future signOut() async {
    try {
        return await _auth.signOut();
    } catch(e) {

      print(e.toString());
      return null;

    }
 }


}