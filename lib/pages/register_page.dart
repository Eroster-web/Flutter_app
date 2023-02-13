// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'consts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  Constants.greet,
                  style: TextStyle(
                    fontSize: Constants.fontSize + 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Constants.height,
                ),
                Text(
                  Constants.reg_inf,
                  style: TextStyle(
                    fontSize: Constants.fontSize + 4,
                  ),
                ),
                SizedBox(
                  height: Constants.height + 40,
                ),
                //first name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: TextField(
                    controller: _firstNameController,
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
                      hintText: Constants.fname,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Constants.white),
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
                SizedBox(height: Constants.height), //password confirm field
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constants.white),
                          borderRadius:
                              BorderRadius.circular(Constants.circleRadius)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Constants.DpPurple),
                        borderRadius:
                            BorderRadius.circular(Constants.circleRadius),
                      ),
                      hintText: Constants.pw_conf,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
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
                    onTap: signUp,
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
                        Constants.regis,
                        style: TextStyle(
                            color: Constants.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSize + 2),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: Constants.height + 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constants.alr_mem,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        Constants.lgn_now,
                        style: TextStyle(
                          color: Constants.Blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
