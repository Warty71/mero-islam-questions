import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({Key? key, this.controller, required this.hintText, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 2, color: Colors.orange.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 2, color: Colors.orange.shade200),
          ),
        ),
      ),
    );
  }
}
