import 'package:flutter/material.dart';

class ResendCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Resend Code ?",
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      textAlign: TextAlign.center,
    );
  }
}
