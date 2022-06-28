import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/rider/r_orderHistory/r_orderDetails.dart';
import 'package:customer/views/widgets/r_tabButton.dart';
import 'package:customer/views/widgets/r_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class R_OrdersHistory extends StatefulWidget {
  @override
  _R_OrdersHistoryState createState() => _R_OrdersHistoryState();
}

class _R_OrdersHistoryState extends State<R_OrdersHistory> {
  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController?.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/r_assets/images/Vector.png")),
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
                    text: "All",
                    pageNumber: 0,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  RTabButton(
                    text: "Completed",
                    pageNumber: 1,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                  RTabButton(
                    text: "Failed",
                    pageNumber: 2,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(2);
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
                  prefixIcon: Image.asset("assets/r_assets/images/Search.png"),
                  suffixIcon: Image.asset("assets/r_assets/images/Filter.png"),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: _pageController,
                children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => R_OrderDetails()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              height: displayHeight(context) * 0.14,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/r_assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
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
                                          "17/5/2021, 22:32",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.08,
                                  ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => R_OrderDetails()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              height: displayHeight(context) * 0.14,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/r_assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
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
                                          "17/5/2021, 22:32",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.08,
                                  ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => R_OrderDetails()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              height: displayHeight(context) * 0.14,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/r_assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
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
                                          "17/5/2021, 22:32",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.08,
                                  ),
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
      bottomNavigationBar: R_TabBarViewData(),
    );
  }
}
