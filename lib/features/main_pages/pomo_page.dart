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
      appBar: AppBar(
        title: const Text('Pomo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Underconstruction!! Please Be Patient',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //does nothing here
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
