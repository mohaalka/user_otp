// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';
// import 'package:user_otp/authertication/authertication_provider.dart';
// import 'package:user_otp/authertication/user_information.dart';
// import '../imagePath/imagesPathes.dart';

// class Otp extends StatefulWidget {
//   final String verificationId;
//   const Otp({Key? key, required this.verificationId}) : super(key: key);

//   @override
//   _OtpState createState() => _OtpState();
// }

// class _OtpState extends State<Otp> {
//   String? smsCode;

//   void verifyOTP({required smsCode}) {
//     final authrepo =
//         Provider.of<AutherTicatationProvider>(context, listen: false);
//     authrepo.verifyOTP(
//         context: context,
//         verificationId: widget.verificationId,
//         smsCode: smsCode,
//         onSuccess: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => UserInformation()));
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authrepo =
//         Provider.of<AutherTicatationProvider>(context, listen: true);
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
//           child: Center(
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black, width: 2),
//                       borderRadius: BorderRadius.circular(90)),
//                   child: CircleAvatar(
//                     radius: 80,
//                     backgroundImage: AssetImage(ImageManager.OpenAi),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Text(
//                   "Register Your Info",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Text(
//                   "Add Your Phone number To send you a verification Code",
//                   style: TextStyle(fontSize: 17),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 45,
//                 ),
//                 Pinput(
//                   length: 6,
//                   showCursor: true,
//                   defaultPinTheme: PinTheme(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.purple.shade200),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       textStyle: TextStyle(fontWeight: FontWeight.w600)),
//                   onCompleted: (value) {
//                     setState(() {
//                       smsCode = value;
//                     });
//                     verifyOTP(smsCode: smsCode);
//                   },
//                 ),
//                 SizedBox(
//                   height: 45,
//                 ),
//                 authrepo.isLogedIn
//                     ? CircularProgressIndicator(
//                         color: Colors.orangeAccent,
//                       )
//                     : SizedBox.shrink(),
//                 Text(
//                   "Didn't receive any code ?",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Resend Code ?",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
