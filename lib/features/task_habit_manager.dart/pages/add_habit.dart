import 'package:flutter/material.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text(
              'You are on the Add Habit page',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Positioned(
            top: 20, // Adjust this to control the vertical position
            right: 20, // Adjust this to control the horizontal position
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Goes back to the previous screen
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 90, 80), // Button color
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white, // Icon color
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
