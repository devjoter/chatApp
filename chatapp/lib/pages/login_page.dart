import 'package:chatapp/components/button_default.dart';
import 'package:chatapp/components/text_field_default.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailControler = TextEditingController();
  final passwordController = TextEditingController();

  // sign in method
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailControler.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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

              // welcome back message
              const SizedBox(height: 50),
              const Text(
                "Welcome Back",
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

              // sign in button
              const SizedBox(height: 100),
              ButtonDefault(onTap: signIn, text: "Sign In"),

              // not a member yet? register now
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Here !!!",
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
