import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/utills/customtextbutton.dart';
import 'package:customer/views/pages/HomeScreen/homepagelayer.dart';
import 'package:customer/views/widgets/r_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RAccountSetting extends StatefulWidget {
  const RAccountSetting({Key key}) : super(key: key);

  @override
  _RAccountSettingState createState() => _RAccountSettingState();
}

class _RAccountSettingState extends State<RAccountSetting> {
  String _userType = 'Rider';

  setUserType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userType", _userType);
    print(_userType);
  }

  getUserType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _user = pref.getString("userType");
    return _user;
  }

  void changeUserType() {
    setState(() {
      _userType = 'Customer';
      setUserType();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _height / 1.98,
                width: displayWidth(context),
                // color: Color.fromRGBO(196, 196, 196, 0.4),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: _height / 2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage("assets/r_assets/images/vehicle.png"),
                        ),
                      ),
                    ),
                    // Container(
                    //     height: _height / 2.5,
                    //     width: displayWidth(context),
                    //     child: Image.asset("assets/r_assets/images/vehicle.png")),
                    Positioned(
                      //   padding: const EdgeInsets.only(
                      //       top: 40.0, left: 15.0, right: 15.0),
                      top: 40.0,
                      left: 15.0,
                      // right: 15.0,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: IconButton(
                                icon: Image.asset(
                                  "assets/r_assets/images/Menu.png",
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                                onPressed: () {
                                  //   _scaffoldKey.currentState!.openDrawer();
                                }),
                            // child: Image.asset("assets/r_assets/images/Vector.png")
                          ),
                          SizedBox(width: 50),
                          Text("Account Information",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 1)))),
                          // Image.asset("assets/r_assets/images/foodimages/Delete1.png"),
                        ],
                      ),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.32,
                      left: displayWidth(context) / 2.7,
                      child: Image.asset(
                          "assets/r_assets/images/subtract_image.png"),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: displayWidth(context),
                // margin: EdgeInsets.only(left: displayWidth(context) * 0.11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Driver Name",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "PAB: UL 2272 ( 472 )",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: displayWidth(context),
                // height: displayHeight(context)/2.5,
                // margin: EdgeInsets.only(left: displayWidth(context) * 0.11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 3.0),
                                child: Text(
                                  "Reviews",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                  )),
                                ),
                              ),
                              Image.asset("assets/r_assets/images/Star.png"),
                            ],
                          ),
                          Text(
                            "4.50",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: _height * 0.02,
                        margin: EdgeInsets.only(
                            left: displayWidth(context) * 0.08,
                            right: displayWidth(context) * 0.08),
                        child: VerticalDivider(color: Colors.red)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 3.0),
                                child: Text(
                                  "Carbon Saving",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                  )),
                                ),
                              ),
                              Image.asset("assets/r_assets/images/leaf.png"),
                            ],
                          ),
                          Text(
                            "0.0 Kg",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height: displayHeight(context) * 1.5,
                width: displayWidth(context),

                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    width: 0.5,
                  )),
                  color: Color.fromRGBO(196, 196, 196, 0.4),
                ),
                // margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Driver Verification",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            )),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: Constants.coloredcontainerstyle(),
                            // color: Color.fromRGBO(94, 207, 99, 1),
                            child: Text(
                              "Verified",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(255, 255, 255, 1))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text(
                          "Please upload the required documents. Get verified to start driving",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'Profile Picture',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'Driving License',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'Vehical Picture',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      // height: displayHeight(context) * 1.5,
                      width: displayWidth(context),

                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          width: 0.5,
                        )),
                        color: Color.fromRGBO(196, 196, 196, 0.4),
                      ),
                      // margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Vehical Model",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                ),
                                Container(
                                  height: 30,
                                  width: 80,
                                  alignment: Alignment.center,
                                  decoration: Constants.coloredcontainerstyle(),
                                  // color: Color.fromRGBO(94, 207, 99, 1),
                                  child: Text(
                                    "Verified",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text(
                                "Hyundai - GETZ",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'Hyundai - GETZ',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      // height: displayHeight(context) * 1.5,
                      width: displayWidth(context),

                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          width: 0.5,
                        )),
                        color: Color.fromRGBO(196, 196, 196, 0.4),
                      ),
                      // margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Vehicle Registration",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                ),
                                Container(
                                  height: 30,
                                  width: 80,
                                  alignment: Alignment.center,
                                  decoration: Constants.coloredcontainerstyle(),
                                  // color: Color.fromRGBO(94, 207, 99, 1),
                                  child: Text(
                                    "Verified",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text(
                                "SKE-2234",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'SKE-2234',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      // height: displayHeight(context) * 1.5,
                      width: displayWidth(context),

                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          width: 0.5,
                        )),
                        color: Color.fromRGBO(196, 196, 196, 0.4),
                      ),
                      // margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PDVL / TDVL Driver",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                ),
                                Container(
                                  height: 30,
                                  width: 80,
                                  alignment: Alignment.center,
                                  decoration: Constants.coloredcontainerstyle(),
                                  // color: Color.fromRGBO(94, 207, 99, 1),
                                  child: Text(
                                    "Verified",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text(
                                "SKE-2234",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading:
                          Image.asset("assets/r_assets/images/checkgreen.png"),
                      title: Text(
                        'Upload Documents',
                        textScaleFactor: 1.5,
                      ),
                      trailing:
                          Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      // height: displayHeight(context) * 1.5,
                      width: displayWidth(context),

                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          width: 0.5,
                        )),
                        color: Color.fromRGBO(196, 196, 196, 0.4),
                      ),
                      // margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Insurance (optional)",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )),
                                ),
                                // Container(
                                //   height: 30,
                                //   width: 80,
                                //   alignment: Alignment.center,
                                //   decoration: Constants.coloredcontainerstyle(),
                                //   // color: Color.fromRGBO(94, 207, 99, 1),
                                //   child: Text(
                                //     "Verified",
                                //     style: GoogleFonts.ubuntu(
                                //         textStyle: TextStyle(
                                //             fontSize: 14,
                                //             fontWeight: FontWeight.w400,
                                //             color: Color.fromRGBO(
                                //                 255, 255, 255, 1))),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text(
                                "Complete insurance details to receive available promotions.",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/r_assets/images/greycheck.png",
                        // color: Colors.grey[400],
                      ),
                      title: Text(
                        'Enter Insurance Name',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.5))),
                        // textScaleFactor: 1.5,
                      ),
                      // trailing: Image.asset("assets/r_assets/images/arrowright.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/r_assets/images/greycheck.png",
                        // color: Colors.grey[400],
                      ),
                      title: Text(
                        'Enter Insurance Expiry Date',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.5))),
                        // textScaleFactor: 1.5,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child:
                            Image.asset("assets/r_assets/images/Calendar.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 20),
                      child: CustomTextButton(
                        buttonName: 'Save Updates',
                        buttonTextStyle: GoogleFonts.ubuntu(
                            textStyle: Constants.loginbuttonstyle()),
                        buttoncolor: Constants.black_light,
                        height: _height * 0.07,
                        width: displayWidth(context) * 0.9,
                        highlightColor: Constants.black_light,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => OTPSCREEN()),
                          // );
                        },
                        textStyle: TextStyle(),
                      ),
                    ),
                    CustomTextButton(
                      buttonName: 'Change As Customer',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.078,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        changeUserType();
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePageLayer()),
                        );
                      },
                      textStyle: TextStyle(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: R_TabBarViewData(),
    );
  }
}
