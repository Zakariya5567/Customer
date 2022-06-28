import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utills/Displaywidth.dart';

class RestaurantProfilePage extends StatefulWidget {
  const RestaurantProfilePage({Key key}) : super(key: key);

  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
//     // path.quadraticBezierTo(size.width/4, size.height
//  - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: displayHeight(context) / 3,
                child: Stack(
                  children: [
                    Image.asset("assets/images/foodimages/gradient_image.png"),
                    Positioned(
                        left: 20,
                        top: 40,
                        child: Container(
                            margin: EdgeInsets.all(20),
                            child:
                                Image.asset("assets/images/chevron_left.png"))),
                  ],
                ),
              ),
            ),
            // center part of screen

            Container(
              height: displayHeight(context) / 4,
              width: displayWidth(context),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Star.png"),
                      Column(children: [
                        Text("3.9",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                        Text("205 people reviewed ",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ))),
                      ]),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/Star.png"),
                      Text("Rating of Hotel"),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/Star.png"),
                      Text("Opening Time"),
                    ],
                  ),
                ],
              ),
            ),
            // Third Part of the screen

            Container(
              height: displayHeight(context) / 2.4,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
