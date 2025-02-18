import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword {
  final FirebaseAuth _auth;

  ResetPassword({required FirebaseAuth auth}) : _auth = auth;

  Future<void> call(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('ResetPassword failed: $e');
    }
  }
}
