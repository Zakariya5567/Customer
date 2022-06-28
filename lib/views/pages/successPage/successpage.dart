
import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/pages/HomeScreen/homepagelayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
                    child: Image.asset("assets/success1.png")),
                Positioned(
                    top: displayHeight(context) / 2 * 0.435,
                    left: displayWidth(context) * 0.25,
                    child: Container(
                      child: Image.asset("assets/success2.png"),
                    )),
                Positioned(
                    top: displayHeight(context) / 2 * 0.462,
                    left: displayWidth(context) * 0.277,
                    child: Container(
                      child: Image.asset("assets/success3.png"),
                    )),
                Positioned(
                    top: displayHeight(context) / 2 * 0.62,
                    left: displayWidth(context) * 0.42,
                    child: Container(
                      child: Image.asset("assets/success4.png"),
                    )),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Successfull!",
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
                  "Continue Shopping",
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
