import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_23april/component/button.dart';
import 'package:login_page_23april/component/squarebox.dart';

import '../component/textfield.dart';

// ignore: camel_case_types
class registerPage extends StatefulWidget {
  final Function()? onTap;
  const registerPage({super.key, required this.onTap});

  @override
  State<registerPage> createState() => _registerPageState();
}

// ignore: camel_case_types
class _registerPageState extends State<registerPage> {
  final emailController = TextEditingController();
  final namaLengkapController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try creating user
    try {
      //  check if password is confirmed
      // if (emailController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // } else {
      //   // show error message, password dont match
      //   showErrorMessage("Passwords don't match");
      // }

      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //  show error message
      showErrorMessage(e.code);
    }
  }

  // error message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orange,
          title: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Image.asset(
                'assets/images/icon.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Let\'s create an account for you!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              myTextField(
                labeltext: 'Username',
                controler: emailController,
                hintText: 'Usename',
                obscureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              myTextField(
                labeltext: 'Nama Lengkap',
                controler: namaLengkapController,
                hintText: 'Nama Lengkap',
                obscureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              myTextField(
                labeltext: 'Password',
                controler: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              myButton(
                text: 'Sign Up',
                onTap: signUserUp,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  squareBox(imagePath: 'assets/images/google-logo.png'),
                  SizedBox(
                    width: 15,
                  ),
                  squareBox(imagePath: 'assets/images/apple-logo.png'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ? ',
                      style: TextStyle(color: Colors.grey[700])),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Login now.',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
    ;
  }
}
