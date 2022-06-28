import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/utills/customtextbutton.dart';
import 'package:customer/views/rider/r_signin/r_sign_in_page.dart';
import 'package:customer/views/widgets/r_wavy_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class R_FirstScreen extends StatefulWidget {
  const R_FirstScreen({Key key}) : super(key: key);

  @override
  _R_FirstScreenState createState() => _R_FirstScreenState();
}

class _R_FirstScreenState extends State<R_FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            R_WavyHeaderImage(),
            SizedBox(
              height: displayHeight(context) * 0.35,
            ),
            Container(
              child: CustomTextButton(
                buttonName: 'GET STARTED',
                buttonTextStyle:
                    GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                buttoncolor: Constants.black_light,
                height: _height * 0.066,
                width: displayWidth(context) * 0.9,
                highlightColor: Constants.black_light,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => R_SignIn()),
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
