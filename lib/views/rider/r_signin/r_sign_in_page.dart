import 'package:country_code_picker/country_code_picker.dart';
import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/utills/customtextbutton.dart';
import 'package:customer/views/rider/r_otp_screen/r_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class R_SignIn extends StatefulWidget {
  const R_SignIn({Key key}) : super(key: key);

  @override
  _R_SignInState createState() => _R_SignInState();
}

class _R_SignInState extends State<R_SignIn> {
  TextEditingController controllernumber = TextEditingController();
  String code = '+92';
  String phoneNumber = "+923043110089";
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
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
                    "Welcome Let's Start",
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.welcomestyle(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "login",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //second part of the screen
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.08,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            "Contry Code",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.4))),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CountryCodePicker(
                              // showDropDownButton: true,
                              initialSelection: 'PK',
                              enabled: true,
                              showDropDownButton: true,

                              onChanged: (CountryCode ccode) {
                                setState(() {
                                  code = ccode.toString();
                                });
                              },
                            ),
                            // Text("Singapore"),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            // Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12,
                          ),
                          // padding: EdgeInsets.only(top: -10),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Text("Phone Number"),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: controllernumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Phone Number ',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.1,
                  ),
                  // controllernumber.text.isEmpty ? Container(
                  //   margin: EdgeInsets.only(left: 35, right: 35),
                  //   child: CustomTextButton(
                  //     buttonName: 'SEND OTP',
                  //     buttonTextStyle: GoogleFonts.ubuntu(
                  //         textStyle: Constants.loginbuttonstyle()),
                  //     buttoncolor: Constants.black_light.withOpacity(0.4),
                  //     height: _height * 0.066,
                  //     width: displayWidth(context) * 0.9,
                  //     highlightColor: Constants.black_light,
                  //     onPressed: () {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(builder: (context) => SignIn()
                  //       //   ),
                  //       // );
                  //     }, textStyle: TextStyle(

                  //   ),
                  //   ),
                  // ):
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'SEND OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        setState(() {
                          phoneNumber = code + controllernumber.text;
                        });
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => R_OTPSCREEN(phoneNumber)),
                        );
                      },
                      textStyle: TextStyle(),
                    ),
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
