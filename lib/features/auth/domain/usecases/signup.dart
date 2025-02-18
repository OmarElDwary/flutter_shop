import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Signup({required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  Future<void> call(String email, String password, String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'email': email,
      });
    } catch (e) {
      throw Exception('SignUp failed: $e');
    }
  }
}
