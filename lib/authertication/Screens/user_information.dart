import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../imagePath/imagesPathes.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final RoundedLoadingButtonController btnControler =
      RoundedLoadingButtonController();

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
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.tealAccent,
                        backgroundImage: AssetImage(ImageManager.OpenAi),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  )),
                            ),
                          ))
                    ],
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.black, width: 2),
                //       borderRadius: BorderRadius.circular(90)),
                // ),
                SizedBox(
                  height: 45,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    myTextFormField(
                        hintText: 'Enter Your name',
                        icon: Icons.account_circle,
                        textInputType: TextInputType.name,
                        maxLength: 25,
                        maxLines: 1,
                        textEditingController: nameController,
                        enabled: true),
                    SizedBox(
                      height: 45,
                    ),
                    myTextFormField(
                        hintText: 'Enter Your Phone',
                        icon: Icons.phone,
                        textInputType: TextInputType.number,
                        maxLength: 10,
                        maxLines: 1,
                        textEditingController: phoneController,
                        enabled: true)
                  ]),
                ),

                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RoundedLoadingButton(
                      controller: btnControler,
                      onPressed: () {},
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

Widget myTextFormField(
    {required String hintText,
    required IconData icon,
    required TextInputType textInputType,
    required int maxLength,
    required int maxLines,
    required TextEditingController textEditingController,
    required bool enabled}) {
  return TextFormField(
    enabled: enabled,
    cursorColor: Colors.deepOrange,
    controller: textEditingController,
    maxLines: maxLines,
    maxLength: maxLength,
    decoration: InputDecoration(
        counterText: '',
        prefixIcon: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        hintText: hintText,
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.purple.shade50,
        filled: true),
  );
}
