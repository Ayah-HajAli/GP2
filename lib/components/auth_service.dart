import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_ios/google_sign_in_ios.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      _firebaseFirestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "name": userCredential.user!.displayName,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      _firebaseFirestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "name": userCredential.user!.displayName,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }


signInWithGoogle()async{

  final GoogleSignInAccount? gUser =await GoogleSignIn().signIn();

  if(gUser==null) return;

  

  final GoogleSignInAuthentication gAuth=await gUser!.authentication;

  final credential =GoogleAuthProvider.credential(
accessToken: gAuth.accessToken,
idToken: gAuth.idToken,

  );

  return await _firebaseAuth.signInWithCredential(credential);


}



  Future<void> addServiceRequest({
    required List<String> selectedServices,
    required List<String> selectedTimes,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("No user logged in");

    await _firebaseFirestore.collection('userSelections').doc(user.uid).set({
      'services': selectedServices,
      'times': selectedTimes,
      'timestamp': FieldValue.serverTimestamp(),
    });

    await _firebaseFirestore.collection('serviceRequests').add({
      'userId': user.uid,
      'services': selectedServices,
      'times': selectedTimes,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
