import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoadingButtonWidget extends StatelessWidget {
  final RoundedLoadingButtonController btnController;
  final Function onPressed;

  LoadingButtonWidget({required this.btnController, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RoundedLoadingButton(
        controller: btnController,
        onPressed: () {
          onPressed();
        },
        successIcon: Icons.check,
        successColor: Colors.green,
        errorColor: Colors.red,
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
