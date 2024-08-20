// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:logger/logger.dart';
import 'package:pettodo/features/app/splash_screen.dart';
import 'package:pettodo/features/main_pages/main_screen.dart';
import 'package:pettodo/features/user_auth/presentation/pages/log_in.dart';
import 'package:pettodo/features/user_auth/presentation/pages/sign_up.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.env['APP_KEY2'] ?? '',
            appId: dotenv.env['APP_ID2'] ?? '',
            messagingSenderId: dotenv.env['MSG_SENDER_ID'] ?? '',
            projectId: dotenv.env['PROJECT_ID'] ?? ''));
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.env['API_KEY1'] ?? '',
            appId: dotenv.env['APP_ID1'] ?? '',
            messagingSenderId: dotenv.env['MSG_SENDER_ID'] ?? '',
            projectId: dotenv.env['PROJECT_ID'] ?? ''));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      routes: {
        '/': (context) => SplashScreen(
              child: LogInScreen(),
            ),
        '/login': (context) => LogInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/home': (context) => MainScreen(),
      },
    );
  }
}
