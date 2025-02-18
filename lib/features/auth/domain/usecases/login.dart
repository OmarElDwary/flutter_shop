import 'package:firebase_auth/firebase_auth.dart';

class Login {
  FirebaseAuth _auth;

  Login({required FirebaseAuth auth}) : _auth = auth;

  Future<void> call(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }
}
