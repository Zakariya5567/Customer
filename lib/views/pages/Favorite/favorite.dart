
import 'package:customer/views/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../order_page/productpage.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key key}) : super(key: key);

  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) + kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 32),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Vector.png")),
                    SizedBox(
                      width: displayWidth(context) * 0.30,
                    ),
                    Text(
                      "Favorite",
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25, bottom: 20.0),
                  height: displayHeight(context) * 0.24018,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.favoriteContainerstyle(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/images/foodimages/product.png"),
                        ],
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.035,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.48,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product Name",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      )),
                                    ),
                                    Image.asset(
                                        "assets/images/foodimages/Heart.png")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/Star.png"),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "4.2 (12k)",
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0, top: 10),
                                child: Text(
                                  "9916 Strawberry Street Montclair, NJ 07042",
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$30 Delivery fee",
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                      width: 31.0,
                                      child: Image.asset(
                                          "assets/images/foodimages/halal_logo.png"),
                                    )
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25, bottom: 20.0),
                  height: displayHeight(context) * 0.24018,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.favoriteContainerstyle(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/images/foodimages/product.png"),
                        ],
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.035,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.48,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product Name",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      )),
                                    ),
                                    Image.asset(
                                        "assets/images/foodimages/Heart.png")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/Star.png"),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "4.2 (12k)",
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0, top: 10),
                                child: Text(
                                  "9916 Strawberry Street Montclair, NJ 07042",
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$30 Delivery fee",
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                      width: 31.0,
                                      child: Image.asset(
                                          "assets/images/foodimages/halal_logo.png"),
                                    )
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
