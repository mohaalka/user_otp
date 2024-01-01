import 'package:flutter/material.dart';

class DidntReceiveCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Didn't receive any code ?",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
