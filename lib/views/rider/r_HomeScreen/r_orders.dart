// import 'dart:html';

import 'package:customer/Theme/Theme.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/pages/chatScreens/chat_main_screen.dart';
import 'package:customer/views/rider/r_accountSetting/r_accountSetting.dart';
import 'package:customer/views/rider/r_earning/r_earning.dart';
import 'package:customer/views/rider/r_orderHistory/r_orderHistory.dart';
import 'package:customer/views/widgets/r_tabButton.dart';
import 'package:customer/views/widgets/r_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ROrderPage extends StatefulWidget {
  const ROrderPage({Key key}) : super(key: key);

  @override
  _ROrderPageState createState() => _ROrderPageState();
}

class _ROrderPageState extends State<ROrderPage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(10.0),
            // children: _listViewData
            //     .map((data) => ListTile(
            //           title: Text(data),
            //         ))
            //     .toList(),
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RAccountSetting()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image(image: AssetImage("assets/r_assets/images/Wallet.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Account Setting",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              // Text("\$87.00",
                              //     style: GoogleFonts.ubuntu(
                              //         textStyle: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 17,
                              //       color: Colors.red,
                              //     ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        // 2nd
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R_OrdersHistory()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/r_assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Order History",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),

                        // 4th
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => REarning()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/r_assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Earnings",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        // 5rd
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatMainScreen()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image(image: AssetImage("assets/r_assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Chat",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    ),
                  ))
            ]),
      ),
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Image.asset("assets/r_assets/images/Menu.png"),
                      // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      }),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Orders",
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
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RTabButton(
                    text: "Orders",
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
                  RTabButton(
                    text: "History",
                    pageNumber: 2,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.only(top: 25, left: 25),
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
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/r_assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/r_assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/r_assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
                          // GestureDetector(
                          //   onTap: () {
                          //     // Navigator.push(
                          //     //   context,
                          //     //   MaterialPageRoute(builder: (context) => OrderDetails()
                          //     //   ),
                          //     // );
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.only(
                          //       top: 25,
                          //     ),
                          //     height: displayHeight(context) * 0.24,
                          //     width: displayWidth(context) / 1.17,
                          //     decoration: Constants.containerstyle(),
                          //     child: Row(
                          //       children: [
                          //         Column(
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   top: 18.0, left: 8.0),
                          //               child: Image.asset(
                          //                   "assets/images/foodimages/kfc.png"),
                          //             ),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           width: displayWidth(context) * 0.035,
                          //         ),
                          //         SizedBox(
                          //           width: displayWidth(context) * 0.40,
                          //           child: Padding(
                          //             padding: const EdgeInsets.only(
                          //                 top: 15.0, right: 10),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(
                          //                   "KFC",
                          //                   style: GoogleFonts.ubuntu(
                          //                       textStyle: TextStyle(
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.w500,
                          //                     color: Colors.black,
                          //                   )),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 8,
                          //                 ),
                          //                 Text(
                          //                   "Mighty Zinger",
                          //                   style: GoogleFonts.ubuntu(
                          //                       textStyle: TextStyle(
                          //                     fontWeight: FontWeight.w400,
                          //                     fontSize: 14,
                          //                     color: Color.fromRGBO(
                          //                         154, 154, 157, 1),
                          //                   )),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 9,
                          //                 ),
                          //                 Text(
                          //                   "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                          //                   style: GoogleFonts.ubuntu(
                          //                       textStyle: TextStyle(
                          //                     fontWeight: FontWeight.w400,
                          //                     fontSize: 14,
                          //                     color: Color.fromRGBO(
                          //                         154, 154, 157, 1),
                          //                   )),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 5,
                          //                 ),
                          //                 Row(
                          //                   children: [
                          //                     Image.asset(
                          //                         "assets/images/timeCircle.png"),
                          //                     SizedBox(
                          //                       width: 10.64,
                          //                     ),
                          //                     Text(
                          //                       "12:00 PM",
                          //                       style: GoogleFonts.ubuntu(
                          //                           textStyle: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.w400,
                          //                         color: Color.fromRGBO(
                          //                             237, 41, 57, 1),
                          //                       )),
                          //                     ),
                          //                   ],
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //         // SizedBox(width: displayWidth(context)*0.08,),
                          //         Column(
                          //           crossAxisAlignment: CrossAxisAlignment.end,
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   top: 15.0, left: 40),
                          //               child: Text(
                          //                 "\$80.00",
                          //                 style: GoogleFonts.ubuntu(
                          //                     textStyle: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.w400,
                          //                   color:
                          //                       Color.fromRGBO(237, 41, 57, 1),
                          //                 )),
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
                          Container(
                            height: displayHeight(context) / 4.3,
                            width: displayWidth(context),
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.07,
                                right: displayWidth(context) * 0.07,
                                top: 20),
                            decoration: Constants.containerstyle(),
                            // color: Color.fromRGBO(255, 255, 255, 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order ID",
                                        style: Constants.orderidstyle(),
                                      ),
                                      Text(
                                        "\$86.00",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.grey[100],
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 15, right: 15, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Category Name",
                                        style: Constants.ordersubcategory(),
                                      ),
                                      Text("1x",
                                          style: Constants.ordersubcategory()),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: displayWidth(context) * 0.78,
                                  child: Text(
                                    "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1))),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/r_assets/images/timeCircle.png"),
                                      Text(
                                        "26-06-2021, 11:00 PM",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    237, 41, 57, 1))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
