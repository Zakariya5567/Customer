import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/utills/customtextbutton.dart';
import 'package:customer/views/pages/otp_screen/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController controllernumber = TextEditingController();
  String code = '+92';
  String phoneNumber = "+923043110089";
   String countryName = "Singapore";
  bool buttonColor;
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
                    height: displayHeight(context) / 2 * 0.076,
                  ),
                  Image(image: AssetImage("assets/images/user_logo.png"),
                  height: displayHeight(context)  * 0.2, 
                  width: displayHeight(context)* 0.46,
                ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "Welcome, Let's Start",
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

         
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         height: displayHeight(context) / 2 * 0.08,
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: 35, right: 35),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               margin: EdgeInsets.only(left: 12),
            //               child: Text(
            //                 "Contry Code",
            //                 textAlign: TextAlign.start,
            //                 style: GoogleFonts.ubuntu(
            //                     textStyle: TextStyle(
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.w400,
            //                         color: Colors.black.withOpacity(0.4))),
            //               ),
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CountryCodePicker(
            //                   // showDropDownButton: true,
            //                   initialSelection: 'PK',
            //                   enabled: true,
            //                   showDropDownButton: true,

            //                   onChanged: (CountryCode ccode) {
            //                     setState(() {
            //                       code = ccode.toString();
            //                     });
            //                   },
            //                 ),
            //                 // Text("Singapore"),
            //                 // SizedBox(
            //                 //   width: 20,
            //                 // ),
            //                 // Icon(Icons.arrow_drop_down_sharp),
            //               ],
            //             ),
            //             Container(
            //               margin: EdgeInsets.only(
            //                 left: 12,
            //               ),
            //               // padding: EdgeInsets.only(top: -10),
            //               child: Divider(
            //                 color: Colors.grey,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: displayHeight(context) / 2 * 0.066,
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: 35, right: 35),
            //         child: Text("Phone Number"),
            //       ),
            //       Container(
            //           margin: EdgeInsets.only(left: 35, right: 35),
            //           child: TextFormField(
            //             controller: controllernumber,
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               border: UnderlineInputBorder(),
            //               labelText: 'Enter Phone Number ',
            //             ),
            //             validator: (value) {
            //               if (value == null || value.isEmpty) {
            //                 return 'Please enter some text';
            //               }
            //               return null;
            //             },
            //           )),
            //       SizedBox(
            //         height: displayHeight(context) / 2 * 0.1,
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: 35, right: 35),
            //         child: CustomTextButton(
            //           buttonName: 'SEND OTP',
            //           buttonTextStyle: GoogleFonts.ubuntu(
            //               textStyle: Constants.loginbuttonstyle()),
            //           buttoncolor: Constants.black_light,
            //           height: _height * 0.066,
            //           width: displayWidth(context) * 0.9,
            //           highlightColor: Constants.black_light,
            //           onPressed: () {
            //             setState(() {
            //               phoneNumber = code + controllernumber.text;
            //             });
            //             // Navigator.pop(context);
            //             if (controllernumber.text.isNotEmpty) {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => OTPSCREEN(phoneNumber)),
            //               );
            //             } else {
            //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //                   content: Text("Enter Your Phone Number.")));
            //             }
            //           },
            //           textStyle: TextStyle(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
         
           Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.08,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

// country code picker --------------------------------------------------------------------------

                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Country Code",
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
                              Row(
                                children: [
                                  CountryCodePicker(
                                    initialSelection: 'SG',
                                    enabled: true,
                                    // showDropDownButton: true,
                                    onChanged: (value) {
                                      setState(() {
                                        code = value.toString();
                                        countryName = value.name;
                                        print(countryName);
                                        print(code);
                                      });
                                    },
                                  ),
                                  Text(countryName.toString(),
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black87, fontSize: 15))
                                ],
                              ),
                             
                                  const Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        


                        Container(
                          margin: const EdgeInsets.only(
                            left: 12,
                          ),
                          // padding: EdgeInsets.only(top: -10),
                          child:const Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black54,
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),

                // phone number section --------------------------------------------------------------------------               
                  Container(
                    margin: const EdgeInsets.only(left: 45, right: 35),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.4))),
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(left: 45, right: 35),
                      child: TextFormField(
                      //focusNode: FocusNode(),
                        controller: controllernumber,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,)
                            ),
                            
                            hintText: 'Enter phone number ',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87)
                            //labelText: 'enter Phone Number ',
                            ),
                        // ignore: missing_return
                        validator: (value) {
                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                         RegExp regExp = new RegExp(patttern);
                            if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                           }
                          
                          else if(!regExp.hasMatch(value)){
                             return 'Please enter valid phone number';
                           };
                           
                        },
                        onChanged: (value){
                          
                          setState(() {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                         RegExp regExp = RegExp(patttern);
                          
                            if(!regExp.hasMatch(value)){
                              buttonColor=false;
                            }
                            else{
                              buttonColor=true;
                            }
                          });

                        },
                      )),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.1,
                  ),

                  //Otp button-----------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'SEND OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: buttonColor==true?Constants.black_light:Colors.grey.shade400,
                      height: _height * 0.09,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        setState(() {
                          // here is phone number using with country code

                          phoneNumber = code + controllernumber.text;
                        });
                        // Navigator.pop(context);
                        if (controllernumber.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPSCREEN(phoneNumber)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      const Text("Enter Your Phone Number.")));
                        }
                      },
                      textStyle: const TextStyle(),
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
