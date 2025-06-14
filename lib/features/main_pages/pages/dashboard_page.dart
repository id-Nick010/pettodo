import 'package:flutter/material.dart';
import '../../../services/firestore_service.dart';
import '../../../models/task_obj.dart';
import 'dart:developer' as dev;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DatabaseService database = DatabaseService();
  List<TaskObj> allTaskData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are on the Dashboard page',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                database.addUser();
              },
              child: const Text("Add User"),
            ),
            ElevatedButton(
                onPressed: () {
                  fetchTasks();
                },
                child: const Text("Display Collection")),
            SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: allTaskData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("TaskName ${allTaskData[index].title}" ??
                            'No Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Deadline: ${allTaskData[index].endDate}"),
                            Text(
                                "Difficulty: ${allTaskData[index].difficulty}"),
                            Text(
                                "Description: ${allTaskData[index].description}"),
                            Text("Done: ${allTaskData[index].isDone}"),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  Future<void> fetchTasks() async {
    List<TaskObj> newTaskData = await database.readTaskColl();
    dev.log("Setting State");
    setState(() {
      allTaskData = newTaskData;
    });
  }
}
