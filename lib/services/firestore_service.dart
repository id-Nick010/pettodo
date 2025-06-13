import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as dev;

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addUser() async {
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        dev.log('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
