import 'package:flutter/material.dart';
import 'package:pettodo/features/main_pages/pomo_page.dart';
import 'package:pettodo/features/user_auth/presentation/pages/sign_up.dart';
import 'package:pettodo/features/user_auth/presentation/widgets/text_field.dart';

import '../widgets/button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // log user in method
  void logUserIn() {}

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
                                                SignUpScreen(),
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
                    const SizedBox(height: 70), //space

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
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                      hoverColor: 0XFFAED6B8,
                    ),

                    const SizedBox(height: 40), //space

                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        hoverColor: 0XFFAED6B8),

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
                                        const PomoPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero));
                      },
                      text: "Log In",
                      colorButton: 0XFFAED6B8,
                    ),

                    const SizedBox(height: 70), //space

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          SignUpScreen(),
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
}
