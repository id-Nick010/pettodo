// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../user_auth/presentation/pages/log_in.dart";
import "../user_auth/presentation/widgets/progress_bar.dart";


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
      late double percentage = 0.0;
    
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: const Color(0xFFFFFAF0), // Set background color to whitish yellow
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
                image: AssetImage('assets/logo-light.png'),
                width: 296,
                height: 297),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                const SizedBox(height: 20), //space
                Text('Make sure to finish your tasks for your pets!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF2B2B2E)
                  )
                ),
            ]),
            const SizedBox(height: 20), //space
            ProgressBar(width: 200, height: 20, progress: percentage)
          ])),
    );
  }
}
