import 'package:flutter/foundation.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import '../mqttstatic/mqttconected.dart';

class Ath with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  Ath() {
    // Listen for changes in the user authentication state
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }
  // Get the current user, if any
  User? get user => _user;

  // bool checkAth() {
  //  if (_auth.currentUser != null) {
  //    return true;
  //  } else {
  ////     return false;
  //   }
//  }

  Future<void> signup(
      String email, String password, String fullName, String phone) async {
    try {
      _auth.signOut();
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sign up successful, user is now signed in
      User user = userCredential.user!;
      print('Sign up successful: ${user.uid}');
      // Update Ath object with new user and notify listeners
      _user = user;
      await Future.delayed(Duration(milliseconds: 2000));
      notifyListeners();
      //  await _auth
      //   .signInWithEmailAndPassword(email: email, password: password);

      // FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //  if (user != null) {
      //   ChangeNotifier();
      //  } else {}
      //   });
      //   final credential = await _auth.signInWithEmailAndPassword(
      //      email: email, password: password);

      //  await FirebaseFirestore.instance
      //     .collection('Users')
      //     .doc(userCredential.user!.uid)
      //    .set({'Full_Name': fullName, 'Phone': phone}).then((value) {
      //  print("User data saved successfully");
      // }).catchError((error) {
      //   print("Failed to save user data: $error");
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signin(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  void signOut() {
    _auth.signOut();
    notifyListeners();
  }
}
