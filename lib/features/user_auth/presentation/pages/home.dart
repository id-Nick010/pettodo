import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("Hello,")],
        ),
      ),
    );
  }
}

                // onTap: () {
                //   FirebaseAuth.instance.signOut();
                //   Navigator.pushNamed(context, "/login");
                //   showToast(message: "Successfully signed out");
                // }, //for signout functionality