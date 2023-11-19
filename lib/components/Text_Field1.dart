import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool ObscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.ObscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: ObscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              fillColor: Colors.teal[500],
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white)),
        ));
  }
}
