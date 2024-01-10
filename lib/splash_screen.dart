// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:pettodo/log_in.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const LogInScreen()),
    //   );
    // });
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
          color: const Color(0xFFFFFAF0), // Set background color to white
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage('assets/logo-light.png'),
              width: 296,
              height: 297,
              fit: BoxFit.fill,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Make sure to finish your tasks for your pets!',
                  style: TextStyle(
                    color: Color(0XFF2B2B2E),
                    fontFamily: 'Lato',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                  )),
            ]),
            Padding(
                padding: EdgeInsets.all(50.0),
                child: LinearPercentIndicator(
                    lineHeight: 25.0,
                    percent: 1,
                    progressColor: Color(0XFFAED6B8),
                    backgroundColor: Color(0xFFFFFAF0),
                    width: 140))
          ])),
    );
  }
}
