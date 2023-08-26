import 'package:flutter/material.dart';

import '../components/button_default.dart';
import '../components/text_field_default.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final emailControler = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up method
  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // logo
              const SizedBox(height: 50),
              Icon(
                Icons.message,
                size: 80,
                color: Colors.grey[800],
              ),

              // create account message
              const SizedBox(height: 50),
              const Text(
                "Lets Create New Account For You",
                style: TextStyle(fontSize: 16),
              ),

              // email textfield
              const SizedBox(height: 50),
              TextFieldDefault(
                controller: emailControler,
                hintText: "hintText",
                obscureText: false,
              ),

              // password textfield
              const SizedBox(height: 10),
              TextFieldDefault(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              // confirm password textfield
              const SizedBox(height: 10),
              TextFieldDefault(
                controller: confirmPasswordController,
                hintText: "Password",
                obscureText: true,
              ),

              // sign up button
              const SizedBox(height: 100),
              ButtonDefault(onTap: signUp, text: "Sign Up"),

              // not a member yet? register now
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member?"),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Log In Here...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
