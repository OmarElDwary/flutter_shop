import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      id: snapshot.id,
      name: data?['name'],
      email: data?['email'],
      password: data?['password'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (password != null) "country": password,
    };
  }
}
