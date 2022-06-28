import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/rider/r_HomeScreen/r_orders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

class R_OTPSCREEN extends StatefulWidget {
  // const R_OTPSCREEN({Key? key}) : super(key: key);
  final String phone;
  R_OTPSCREEN(this.phone);

  @override
  _R_OTPSCREENState createState() => _R_OTPSCREENState();
}

class _R_OTPSCREENState extends State<R_OTPSCREEN> {
  // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
   String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    // color: const Color.fromRGBO(255, 255, 255, 1),
    // borderRadius: BorderRadius.circular(10.0),
    border: Border(
      bottom: BorderSide(width: 1, color: Colors.black),
      // color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ROrderPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("verification Failed.")));
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('code sent')));
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 10));
  }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: displayHeight(context) / 2,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Image(
                      image:
                          AssetImage("assets/r_assets/images/rider_logo.png")),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "OTP VERIFICATION",
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.otp1style(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.045,
                  ),
                  Text(
                    "Enter the OTP sent on your phone number",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //second part of the screen
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 40,
                      right: 40,
                    ),
                    child: PinPut(
                      // obscureText: "*",
                      // hintText: "*",
                      fieldsCount: 6,
                      textStyle:
                          const TextStyle(fontSize: 25.0, color: Colors.black),
                      eachFieldWidth: 40.0,
                      eachFieldHeight: 55.0,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.fade,
                      onSubmit: (pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _verificationCode,
                                      smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ROrderPage()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('invalid OTP')));
                          // _scaffoldkey.currentState!.showSnackBar(
                          // SnackBar(content: Text('invalid OTP')));
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 28, left: 20, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Didn't received code?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "resend",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
