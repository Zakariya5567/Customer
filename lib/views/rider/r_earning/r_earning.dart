import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/widgets/r_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class REarning extends StatefulWidget {
  const REarning({Key key}) : super(key: key);

  @override
  _REarningState createState() => _REarningState();
}

class _REarningState extends State<REarning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/r_assets/images/Menu.png")),
                    SizedBox(
                      width: displayWidth(context) * 0.25,
                    ),
                    Text(
                      "Earnings",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: Constants.containerstyle(),
                height: displayHeight(context) * 0.12,
                width: displayWidth(context) / 1.1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Monthly",
                            style: Constants.earningtextstyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$400.00",
                            style: Constants.earningstyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weekly",
                            style: Constants.earningtextstyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$130.00",
                            style: Constants.earningstyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today",
                            style: Constants.earningtextstyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$76.00",
                            style: Constants.earningstyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  style: Constants.blacknormalstyle(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order ID",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:32 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$12.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "54684132",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:34 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$50.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "02 June,2021",
                  style: Constants.blacknormalstyle(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order ID",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:32 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$12.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "54684132",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:34 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$50.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "01 June, 2021",
                  style: Constants.blacknormalstyle(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order ID",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:32 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$12.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: displayHeight(context) * 0.09,
                width: displayWidth(context) / 1.1,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "54684132",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "12:34 PM",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(121, 118, 125, 1))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "\$50.00",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(94, 207, 99, 1))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: R_TabBarViewData(),
    );
  }
}
