

import 'package:customer/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NearYouItem extends StatelessWidget {
  const NearYouItem ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (2 / 1.8),
                                  ),
                                  itemCount:6,
                                  itemBuilder: (context, index) {
                                    
                                    return Padding(
                                  padding: const EdgeInsets.only(right: 5,top: 5,bottom: 5),
                                  child: 
                                  Container(
                                    //height: displayHeight(context) * 0.200,
                                  //  width: displayHeight(context) * 0.340,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                       //  height: displayHeight(context) * 0.280,
                                          width: displayWidth(context) /4.8,
                                          decoration: BoxDecoration(
                                               color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/foodimages/slider_image1.png"))),
                                          child: Stack(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: 
                                                    CircleAvatar(
                                                      radius: 15,
                                                    backgroundColor: Colors.white,
                                                      child: 
                                                    Image.asset(
                                                      "assets/images/love.png",
                                                      scale: 28,
                                                    ),
                                                    ),
                                                  )),
                                                 Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: 
                                                 
                                                    Image.asset(
                                                      "assets/images/foodimages/halal_logo.png",
                                                      scale: 1.5,
                                                    ),
                                                   
                                                  )),
                                         ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "BRAND NAME",
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "9918 Strawberry street manschister, Nj0742",
                                                  maxLines: 3,
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  
                                                  "Rs 30 Delivery fee",
                                                  maxLines: 2,
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "⭐4.2 (13k)",
                                                  maxLines: 1,
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                                   }),
                   );
    
  }
}















 
                    