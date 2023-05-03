import 'package:flutter/material.dart';

// ignore: camel_case_types
class myTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controler;
  final String hintText;
  final bool obscureText;
  final String labeltext;

  const myTextField(
      {super.key,
      required this.controler,
      required this.labeltext,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controler,
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labeltext,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
