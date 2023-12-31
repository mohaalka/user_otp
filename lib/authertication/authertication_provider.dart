import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:user_otp/authertication/otp.dart';

import '../utility/firebase_option.dart';

class AutherTicatationProvider extends ChangeNotifier {
  bool _isLogedIn = true;
  bool _isSuccessFull = false;
  String? _ud;
  String? _phoneNumber;

  String? get uid => _ud;
  String? get phoneNumber => _phoneNumber;
  bool get isSuccessFull => _isSuccessFull;
  bool get isLogedIn => _isLogedIn;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void signWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required RoundedLoadingButtonController btnController,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          _phoneNumber = phoneNumber;
          notifyListeners();
          btnController.success();
          print("codeSent waa lasoo dhex galay");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Otp(
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseException catch (e) {
      // show eror
      btnController.reset();
      showSnakeBar(context: context, content: e.toString());
    }
  }

  verifyOTP({
    required BuildContext context,
    required String verificationId,
    required smsCode,
    required Function onSuccess,
  }) async {
    _isLogedIn = true;
    notifyListeners();
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      User? user =
          (await firebaseAuth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        _ud = user.uid;
        notifyListeners();
        onSuccess();
      }
    } on FirebaseException catch (e) {
      _isLogedIn = false;
      notifyListeners();
      showSnakeBar(context: context, content: e.toString());
    }
  }
}
