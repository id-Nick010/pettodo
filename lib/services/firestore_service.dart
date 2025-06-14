import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pettodo/models/task_obj.dart';
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

  Future<void> readDatabase() async {
    await db.collection('users').get().then((event) {
      for (var doc in event.docs) {
        dev.log("${doc.id} => ${doc.data()}");
      }
    });
  }

// Future<List<TaskObj>> readTaskColl() async {
//   var snapshot = await FirebaseFirestore.instance.collection('tasks').get();
//   return snapshot.docs.map((doc) => TaskObj.fromFirestore(doc.data())).toList();
// }

  Future<List<TaskObj>> readTaskColl() async {
    try {
      List<TaskObj> taskList = [];
      TaskObj newTask;
      await db.collection('tasks').get().then((event) {
        for (var doc in event.docs) {
          newTask = TaskObj.fromFirestore(doc.data());
          taskList.add(newTask);
        }
      });
      return taskList;
    } catch (e) {
      dev.log("Error fetching tasks: $e");
      return [];
    }
  }
}
