import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends StatelessWidget {
  final Function(String) onCompleted;

  PinInputWidget({required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      showCursor: true,
      defaultPinTheme: PinTheme(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple.shade200),
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
      onCompleted: onCompleted,
    );
  }
}
