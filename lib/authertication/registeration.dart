import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:user_otp/authertication/otp.dart';
import 'package:user_otp/imagePath/imagesPathes.dart';

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
      e164Key: '');

  final RoundedLoadingButtonController btnControler =
      RoundedLoadingButtonController();

  void dispose() {
    phoneController.dispose();
    btnControler.stop();
    super.dispose();
  }

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
                  height: 20,
                ),
                Text(
                  "Add Your Phone number To send you a verification Code",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: phoneController,
                    textInputAction: TextInputAction.done,
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontWeight: FontWeight.w900),
                    decoration: InputDecoration(
                        hintText: "Please Eneter Code to verify",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.yellowAccent)),
                        prefixIcon: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 12.0, 8.0, 12.0),
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                      context: context,
                                      countryListTheme: CountryListThemeData(
                                          bottomSheetHeight: 600),
                                      onSelect: (value) {
                                        setState(() {
                                          selectedCountry = value;
                                        });
                                      });
                                },
                                child: Text(
                                    '${selectedCountry.flagEmoji}+${selectedCountry.phoneCode}'),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RoundedLoadingButton(
                      controller: btnControler,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Otp()));
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
                            letterSpacing: 1.5),
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
