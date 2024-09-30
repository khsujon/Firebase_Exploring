import 'package:firebase_auth_explore/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Icon(
                Icons.lock,
                size: 150,
                color: Colors.grey[700],
              ),
              SizedBox(
                height: height * 0.06,
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
                hintText: 'User Name',
                obscure: false,
                controller: userNameController,
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
                      'Forgot Passwor?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
