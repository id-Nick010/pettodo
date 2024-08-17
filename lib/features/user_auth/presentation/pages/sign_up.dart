import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pettodo/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:pettodo/features/user_auth/presentation/pages/log_in.dart';
import 'package:pettodo/features/user_auth/presentation/widgets/icon_button.dart';
import 'package:pettodo/features/user_auth/presentation/widgets/text_field.dart';
import 'package:pettodo/global/common/toast.dart';

import '../widgets/button.dart'; //widget import

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isSignUp = false;
  bool _isGSignUp = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //text editing controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                LogInScreen(),
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
                                          "Log In",
                                          style: TextStyle(
                                            color: Color(0XFF2B2B2E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(width: 5), //space
                                Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0XFFFECB66),
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: const Color(0XFF2B2B2E),
                                          width: 1.8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Color(0XFF2B2B2E),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 50, width: 10)
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50), //space

                    const Text('Create Account',
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF2B2B2E))),

                    const SizedBox(height: 50), //space

                    MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        hoverColor: 0XFFFECB66,
                        isPasswordField: false),

                    const SizedBox(height: 30), //space

                    MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                        hoverColor: 0XFFFECB66,
                        isPasswordField: false),

                    const SizedBox(height: 30), //space

                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        hoverColor: 0XFFFECB66,
                        isPasswordField: true),

                    const SizedBox(height: 50), //space

                    MyButton(
                      onTap: signUserUp,
                      text: _isSignUp ? "Loading...":"Sign Up",
                      colorButton: 0XFFFECB66,
                      onLoading: _isSignUp,
                    ),
                    
                    const SizedBox(height: 10), //space

                    MyIconButton(
                      onTap: googleSignIn,
                      text: "Sign In with Google",
                      colorButton: 0XFF2B2B2E,
                      iconname: FontAwesomeIcons.google,
                      onLoading: _isGSignUp,
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
                                          LogInScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',
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

  void signUserUp() async {
    setState(() {
      _isSignUp = true;
    });

    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpwithEmailandPassword(email, password);
    
    setState(() {
      _isSignUp = false;
    });

    if (user != null) {
      if (kDebugMode) {
        print("User is successfully created");
      }
      Navigator.pushNamed(context, "/home");
    } else {
      if (kDebugMode) {
        print("Some error happened");
      }
    }
  }
  googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    
    setState(() {
      _isGSignUp = true;
    });

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
    setState(() {
      _isGSignUp = false;
    });
  }
}
