// registeration_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Widgets/avatar_widget.dart';
import '../Widgets/description_widget.dart';
import '../Widgets/loading_button_widget.dart';
import '../Widgets/phone_input_widget.dart';
import '../Widgets/title_widget.dart';
import 'authertication_provider.dart';

class Registeration extends StatefulWidget {
  const Registeration({Key? key}) : super(key: key);

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "252",
    countryCode: "SOM",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Somalia",
    example: "Somalia",
    displayName: "Somalia",
    displayNameNoCountryCode: "SOM",
    e164Key: '',
  );

  final RoundedLoadingButtonController btnControler =
      RoundedLoadingButtonController();

  void dispose() {
    phoneController.dispose();
    btnControler.stop();
    super.dispose();
  }

  void sendPhoneNumber() {
    final authrepo =
        Provider.of<AutherTicatationProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    String fullPhoneNumber = '${selectedCountry.phoneCode}$phoneNumber';

    print('phone Numer: $phoneNumber');
    print('Full phone Numer: $fullPhoneNumber');

    authrepo.signWithPhone(
      context: context,
      phoneNumber: fullPhoneNumber,
      btnController: btnControler,
    );
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
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
                  SizedBox(height: 20),
                  DescriptionWidget(),
                  SizedBox(height: 45),
                  PhoneInputWidget(
                    phoneController: phoneController,
                    selectedCountry: selectedCountry,
                  ),
                  SizedBox(height: 25),
                  LoadingButtonWidget(
                    btnController: btnControler,
                    onPressed: () {
                      setState(() {
                        sendPhoneNumber();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
