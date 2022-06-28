import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../restaurant_detailPage/restaurant_detailpage.dart';

class IttalianItems extends StatelessWidget {
  IttalianItems ({Key key}) : super(key: key);

  RestaurantDetailController restaurantDetailController =Get.put(RestaurantDetailController());

  @override
  Widget build(BuildContext context) {
    return 
     Container(
                        height: displayHeight(context) * 0.180,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0,top: 10,bottom: 10),
                                child: 
                                InkWell(
                                onTap: ()async{
                                  restaurantDetailController.setLoading(true);
                                  Get.to(RestaurantDetail());
                                  await restaurantDetailController.getrestaurantDetail("149");
                                 
                                  restaurantDetailController.setLoading(false);
                                },
                                  child: Container(
                                    height: displayHeight(context) * 0.180,
                                    width: displayHeight(context) * 0.340,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: displayHeight(context) * 0.180,
                                          width: displayWidth(context) / 3.2,
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
                                                      radius: 18,
                                                    backgroundColor: Colors.white,
                                                      child: 
                                                    Image.asset(
                                                      "assets/images/love.png",
                                                      scale: 23,
                                                    ),
                                                    ),
                                                  )),
                                              Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:const  EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Container(
                                                      width:
                                                          displayWidth(context) /
                                                              3.8,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(30),
                                                        )
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                5.0),
                                                        child: Text(
                                                          "30% Off",
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            textStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                       Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
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
                                                        fontSize: 14,
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
                                                        fontSize: 13,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                // Text(
                                                  
                                                //   "Rs 30 Delivery fee",
                                                //   maxLines: 1,
                                                //   style: GoogleFonts.ubuntu(
                                                //     textStyle: const TextStyle(
                                                //         fontSize: 13,
                                                //         fontWeight:
                                                //             FontWeight.w500),
                                                //   ),
                                                //   textAlign: TextAlign.start,
                                                // ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "⭐4.2 (13k)",
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )],
                                    ),
                                  ),
                                ),
                              );
                            })));

    
  }
}