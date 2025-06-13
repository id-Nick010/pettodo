import 'package:flutter/material.dart';
import '../../../services/firestore_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DatabaseService database = DatabaseService();

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
          ],
        ),
      ),
    );
  }
}
