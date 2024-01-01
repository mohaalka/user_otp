// main.dart
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../Widgets/avatar_widget.dart';
import '../Widgets/description_widget.dart';
import '../Widgets/didnt_receive_code_widget.dart';
import '../Widgets/loading_indicator_widget.dart';
import '../Widgets/pin_input_widget.dart';
import '../Widgets/resend_code_widget.dart';
import '../Widgets/title_widget.dart';

import 'authertication_provider.dart';
import 'user_information.dart';

class userOTPInfo extends StatefulWidget {
  final String verificationId;

  const userOTPInfo({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<userOTPInfo> {
  String? smsCode;

  void verifyOTP({required smsCode}) {
    final authRepo =
        Provider.of<AutherTicatationProvider>(context, listen: false);
    authRepo.verifyOTP(
      context: context,
      verificationId: widget.verificationId,
      smsCode: smsCode,
      onSuccess: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInformation()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 35.0,
            ),
            child: Center(
              child: Column(
                children: [
                  AvatarWidget(),
                  SizedBox(height: 25),
                  TitleWidget(),
                  SizedBox(height: 25),
                  DescriptionWidget(),
                  SizedBox(height: 45),
                  PinInputWidget(
                    onCompleted: (value) {
                      setState(() {
                        smsCode = value;
                      });
                      verifyOTP(smsCode: smsCode);
                    },
                  ),
                  SizedBox(height: 45),
                  LoadingIndicatorWidget(),
                  DidntReceiveCodeWidget(),
                  SizedBox(height: 10),
                  ResendCodeWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
