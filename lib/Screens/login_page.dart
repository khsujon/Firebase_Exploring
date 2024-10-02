import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_explore/Widgets/custom_button.dart';
import 'package:firebase_auth_explore/Widgets/custom_text_field.dart';
import 'package:firebase_auth_explore/Widgets/squre_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailNameController = TextEditingController();

  final passwordController = TextEditingController();

  //signin function
  void signIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailNameController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Error: ${e.code}');

      errorMessage();
    }
  }

  void errorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid informations'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Icon(
                  Icons.lock,
                  size: 150,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  'Welcome back!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                SizedBox(
                  height: height * 0.03,
                ),

                //User name
                CustomTextField(
                  hintText: 'User Email',
                  obscure: false,
                  controller: emailNameController,
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                //password filed
                CustomTextField(
                  hintText: 'Password',
                  obscure: true,
                  controller: passwordController,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, top: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                CustomButton(
                  onTap: signIn,
                ),

                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * 0.06,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SquareTile(imagePath: 'lib/images/gogle.png'),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    const SquareTile(imagePath: 'lib/images/aple.png'),
                  ],
                ),

                SizedBox(
                  height: height * 0.06,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const Text(
                      ' Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
