import 'package:flutter/material.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'You are on the Pets page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
