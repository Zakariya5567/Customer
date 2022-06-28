
import 'package:customer/views/pages/mainScreen/mainSplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../../utills/customtextbutton.dart';
import '../../widgets/wavy_first_screen.dart';
import '../HomeScreen/homepagelayer.dart';
import '../signin/sign_in_page.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: 
        
        SingleChildScrollView(
           child: Column(
            children: [
              WavyHeaderImage(),
              SizedBox(
                height: displayHeight(context) * 0.25,
              ),
              Container(
                child: CustomTextButton(
                  buttonName: 'GET STARTED',
                  buttonTextStyle:
                      GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                  buttoncolor: Constants.black_light,
                  height: _height * 0.086,
                  width: displayWidth(context) * 0.9,
                  highlightColor: Constants.black_light,
                  onPressed: () {
                    
                    print("button pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  textStyle: TextStyle(),
                ),
              )
            
            ],
                 ),
         ),
      
    );
  }
}
