import 'package:flutter/material.dart';

class ChatBabble extends StatelessWidget {
  final String message;

  const ChatBabble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: Colors.teal),
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
