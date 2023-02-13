// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'consts.dart';
import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.android,
                  size: Constants.icon_size,
                ),
                //greetings
                SizedBox(
                  height: Constants.height,
                ),

                Text(
                  Constants.greet2,
                  style: TextStyle(
                    fontSize: Constants.fontSize + 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Constants.height,
                ),
                Text(
                  Constants.greet3,
                  style: TextStyle(
                    fontSize: Constants.fontSize + 4,
                  ),
                ),
                SizedBox(
                  height: Constants.height + 40,
                ),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.circleRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.DpPurple,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.circleRadius,
                        ),
                      ),
                      hintText: Constants.email,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height,
                ),
                Padding(
                  //password
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.circleRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.DpPurple,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.circleRadius,
                        ),
                      ),
                      hintText: Constants.pw,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding - 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          Constants.forg_pw,
                          style: TextStyle(
                            color: Constants.Blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Constants.height,
                ),
                //button
                Padding(
                  //SIGN IN BUTTON
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(
                        Constants.padding - 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(
                          Constants.circleRadius,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Constants.sign,
                          style: TextStyle(
                            color: Constants.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSize + 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height + 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constants.no_mem,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        Constants.reg,
                        style: TextStyle(
                          color: Constants.Blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
