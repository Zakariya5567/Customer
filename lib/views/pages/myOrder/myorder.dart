import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../widgets/r_tabButton.dart';
import '../../widgets/tab_bar_view.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectPage = 0;
  PageController _pageControle;

  void _changePage(int pageNumber) {
    setState(() {
      _selectPage = pageNumber;
      _pageControle?.animateToPage(
        pageNumber,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageControle = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageControle?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 25),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/Vector.png")),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Order History",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RTabButton(
                    text: "All Orders",
                    pageNumber: 0,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  RTabButton(
                    text: "Scheduled",
                    pageNumber: 1,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.only(top: 25),
              height: displayHeight(context) * 0.066,
              width: displayWidth(context) / 1.17,
              decoration: Constants.containerstyle(),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Image.asset("assets/images/Search.png"),
                  suffixIcon: Image.asset("assets/images/Filter.png"),
                ),
              ),
            ),
            // list data
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectPage = page;
                  });
                },
                controller: _pageControle,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => OrderDetails()
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 25,
                              ),
                              height: displayHeight(context) * 0.24,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "KFC",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Mighty Zinger",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/timeCircle.png"),
                                              SizedBox(
                                                width: 10.64,
                                              ),
                                              Text(
                                                "12:00 PM",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: displayWidth(context)*0.08,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 40),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => OrderDetails()
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 25,
                              ),
                              height: displayHeight(context) * 0.24,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "KFC",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Mighty Zinger",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/timeCircle.png"),
                                              SizedBox(
                                                width: 10.64,
                                              ),
                                              Text(
                                                "12:00 PM",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: displayWidth(context)*0.08,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 40),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => OrderDetails()
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 25,
                              ),
                              height: displayHeight(context) * 0.24,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "KFC",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Mighty Zinger",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/timeCircle.png"),
                                              SizedBox(
                                                width: 10.64,
                                              ),
                                              Text(
                                                "12:00 PM",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: displayWidth(context)*0.08,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 40),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => OrderDetails()
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 25,
                              ),
                              height: displayHeight(context) * 0.24,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "KFC",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Mighty Zinger",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/timeCircle.png"),
                                              SizedBox(
                                                width: 10.64,
                                              ),
                                              Text(
                                                "12:00 PM",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: displayWidth(context)*0.08,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 40),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => OrderDetails()
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 25,
                              ),
                              height: displayHeight(context) * 0.24,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "KFC",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Mighty Zinger",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  154, 154, 157, 1),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/timeCircle.png"),
                                              SizedBox(
                                                width: 10.64,
                                              ),
                                              Text(
                                                "12:00 PM",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: displayWidth(context)*0.08,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 40),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
