// phone_input_widget.dart
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneInputWidget extends StatefulWidget {
  final TextEditingController phoneController;
  Country selectedCountry;

  PhoneInputWidget(
      {required this.phoneController, required this.selectedCountry});

  @override
  _PhoneInputWidgetState createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.phoneController,
        textInputAction: TextInputAction.done,
        maxLength: 9,
        keyboardType: TextInputType.number,
        style: TextStyle(fontWeight: FontWeight.w900),
        onChanged: (value) {
          setState(() {
            widget.phoneController.text = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Please Enter Code to verify",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.yellowAccent),
          ),
          prefixIcon: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      countryListTheme: CountryListThemeData(
                        bottomSheetHeight: 600,
                      ),
                      onSelect: (value) {
                        setState(() {
                          widget.selectedCountry = value;
                        });
                      },
                    );
                  },
                  child: Text(
                      '${widget.selectedCountry.flagEmoji}+${widget.selectedCountry.phoneCode}'),
                ),
              ),
            ),
          ),
          suffixIcon: widget.phoneController.text.length >= 9
              ? Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.done,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
