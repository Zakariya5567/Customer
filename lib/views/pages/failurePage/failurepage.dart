
import 'package:customer/views/pages/HomeScreen/homepagelayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';

class FailurePage extends StatefulWidget {
  const FailurePage({Key key}) : super(key: key);

  @override
  _FailurePageState createState() => _FailurePageState();
}

class _FailurePageState extends State<FailurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: displayHeight(context) / 2,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        // top: displayHeight(context) / 2 * 0.001
                        ),
                    child: Image.asset("assets/failure1.png")),
                Positioned(
                    top: displayHeight(context) / 2 * 0.435,
                    left: displayWidth(context) * 0.25,
                    child: Container(
                      child: Image.asset("assets/failure2.png"),
                    )),
                Positioned(
                    top: displayHeight(context) / 2 * 0.462,
                    left: displayWidth(context) * 0.277,
                    child: Container(
                      child: Image.asset("assets/failure3.png"),
                    )),
                Positioned(
                    top: displayHeight(context) / 2 * 0.62,
                    left: displayWidth(context) * 0.42,
                    child: Container(
                      child: Image.asset("assets/failure4.png"),
                    )),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Failure!",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                )),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: displayWidth(context) * 0.075,
                  right: displayWidth(context) * 0.05,
                  top: displayHeight(context) * 0.025),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipisciing elit. Vitae dictum mattis enim sed. Sit fermentum risus pharetra enim.",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.57))),
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.15,
            ),
           
            InkWell(
              onTap: ()async{

                Get.to(HomePageLayer());

              },
              child: Container(
                alignment: Alignment.center,
                height: displayHeight(context) * 0.09,
                width: displayWidth(context),
                margin: EdgeInsets.only(
                    left: displayWidth(context) * 0.050,
                    right: displayWidth(context) * 0.050),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "Back to Checkout",
                  style: Constants.loginbuttonstyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
