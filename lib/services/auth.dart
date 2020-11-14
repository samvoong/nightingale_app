import 'package:firebase_auth/firebase_auth.dart';
import 'package:nightingale_v1/models/user.dart';
import 'package:nightingale_v1/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //user obj firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  } 
  
  Future signinAnon() async {
    try {

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pass 

  Future registerWithEmailAndPassword(String email, String password) async {
    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      FirebaseUser user = result.user;

      // //create a new document for the user with the uid 
      // await DatabaseService(uid: user.uid).updateUserData('0', 'name is a name', 100);

      //med 

      await DatabaseService(uid: user.uid).updateUserData('Paracetamol', 'This is just a random notes');



      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

    Future signInWithEmailAndPassword(String email, String password) async {
    try{

      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}