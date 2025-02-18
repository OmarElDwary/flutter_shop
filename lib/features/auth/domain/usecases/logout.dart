import 'package:firebase_auth/firebase_auth.dart';

class Logout {
  final FirebaseAuth _auth;

  Logout({required FirebaseAuth auth}) : _auth = auth;

  Future<void> call() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }
}
