import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../imagePath/imagesPathes.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(90)),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(ImageManager.OpenAi),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Register Your Info",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Add Your Phone number To send you a verification Code",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple.shade200),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: TextStyle(fontWeight: FontWeight.w600)),
                  onCompleted: (value) {
                    print('value ${value}');
                  },
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Didn't receive any code ?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Resend Code ?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
