
import 'package:customer/controller/login_controller.dart';
import 'package:customer/views/pages/signin/sign_in_page.dart';
import 'package:customer/views/widgets/wavy_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../../utills/customtextbutton.dart';
import '../firstScreen/splash_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

LoginController loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return 
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              WavyHeaderImage(),
              SizedBox(
                height: displayHeight(context) * 0.13,
              ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'As a Customer',
                      buttonTextStyle:
                          GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.086,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
            
                        loginController.setUserType(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      textStyle: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'As a Rider',
                      buttonTextStyle:
                          GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.086,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        loginController.setUserType(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      textStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            );
          
        }
      ),
    );
  }
}
