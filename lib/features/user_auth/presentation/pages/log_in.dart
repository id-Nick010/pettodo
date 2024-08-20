import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pettodo/features/main_pages/main_screen.dart';
import 'package:pettodo/features/user_auth/presentation/pages/sign_up.dart';
import 'package:pettodo/features/user_auth/presentation/widgets/text_field.dart';
import 'package:pettodo/global/common/toast.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';
import '../widgets/button.dart';
import '../widgets/icon_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //text editing controllers
  bool _isLogin = false;
  bool _isGLogin = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //text editing controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFFFFAF0),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 70,
                          width: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color(0XFF2B2B2E), width: 1.8),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0XFFAED6B8),
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: const Color(0XFF2B2B2E),
                                          width: 1.8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                          color: Color(0XFF2B2B2E),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                const SizedBox(width: 5), //space
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                const SignUpScreen(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero));
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Color(0XFF2B2B2E),
                                            fontSize: 18,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 50, width: 10)
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50), //space

                    const Text('Welcome!',
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF2B2B2E))),

                    const Text('Your pet is waiting for you',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF2B2B2E))),

                    const SizedBox(height: 50), //space

                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      hoverColor: 0XFFAED6B8,
                      isPasswordField: false,
                    ),

                    const SizedBox(height: 30), //space

                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        hoverColor: 0XFFAED6B8,
                        isPasswordField: true),

                    const SizedBox(height: 20), //space

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF2B2B2E),
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50), //space

                    MyButton(
                      // onTap: logUserIn(context),
                      onTap: () {
                        //this is just temporary
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const MainScreen(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero));
                      },
                      text: "Log In",
                      colorButton: 0XFFAED6B8,
                      onLoading: _isLogin,
                    ),

                    const SizedBox(height: 10), //space

                    MyIconButton(
                      onTap: googleSignIn,
                      text: "Sign In with Google",
                      colorButton: 0XFF2B2B2E,
                      iconname: FontAwesomeIcons.google,
                      onLoading: _isGLogin,
                    ),

                    const SizedBox(height: 30), //space

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          const SignUpScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New to pettodo?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0XFF2B2B2E),
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void logUserIn() async {
    setState(() {
      _isLogin = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isLogin = false;
    });

    if (!mounted) return;

    if (user != null) {
      if (kDebugMode) {
        print("User is successfully signedIn");
      }
      Navigator.pushNamed(context, "/home");
    } else {
      if (kDebugMode) {
        print("Some error happened");
      }
    }
  }

  googleSignIn() async {
    setState(() {
      _isGLogin = true;
    });
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        // Check if the widget is still mounted before using the context
        if (!mounted) return;
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
    setState(() {
      _isGLogin = false;
    });
  }
}
