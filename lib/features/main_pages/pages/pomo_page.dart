import 'package:flutter/material.dart';

class PomoPage extends StatefulWidget {
  const PomoPage({super.key});

  @override
  State<PomoPage> createState() => _PomoPageState();
}

class _PomoPageState extends State<PomoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFDF6EC), // Background color similar to the image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top row with the circles
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle,
                    size: 24, color: Colors.black), // Filled circle
                SizedBox(width: 20),
                Icon(Icons.circle, size: 24, color: Colors.black),
                SizedBox(width: 20),
                Icon(Icons.circle_outlined,
                    size: 24, color: Colors.black), // Empty circle
                SizedBox(width: 20),
                Icon(Icons.circle_outlined, size: 24, color: Colors.black),
              ],
            ),
            const SizedBox(height: 40),

            // Circular timer
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 0.75, // Progress value
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.greenAccent, // Progress color
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Focus",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "20:19",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pause_circle_filled,
                          size: 48), // Pause button
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Task input and calendar icon
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle_outlined, size: 24, color: Colors.black),
                SizedBox(width: 10),
                Text("Task #1", style: TextStyle(fontSize: 18)),
                Spacer(),
                Icon(Icons.calendar_today_outlined,
                    size: 24, color: Colors.black),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
