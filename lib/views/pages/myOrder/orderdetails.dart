import 'package:customer/controller/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  OrderHistoryController orderHistoryController=Get.put(OrderHistoryController());
  static const _initialCameraPosition =
  CameraPosition(target: LatLng(33.773972, -122.431297), zoom: 11.5);
  GoogleMapController _googleMapController;

  

  @override
  Widget build(BuildContext context) {

    final order= orderHistoryController.orderHistoryModel.orders;
    final productList= order[orderHistoryController.orderIndex].products;
    //final subtotal=orderHistoryController.setSubtotal();
    return Scaffold(
      body: 
    
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     GestureDetector(
                            onTap: () async {
                             Get.back();
                            },
                          child: Image.asset(
                              "assets/images/arrow_back.png",color: Colors.black,height: 25,)),

                               Text(
                        "ORDER HISTORY",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    SizedBox(width: 20,)
                  ],
                ),
               
                SizedBox(
                  height: 20,
                ),
               
               
                Container(
                  height: displayHeight(context) * 0.38,
                 // width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Padding(
                             padding: const EdgeInsets.only(bottom:15.0),
                             child: Text(
                        "ORDER DETAILS",
                        style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                      ),
                      
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical:8.0),
                             child: Divider(
                              color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                              height: 0.5,
                          ),
                           ),
                        Text(
                          "Order Number",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Text(
                           
                          "${order[orderHistoryController.orderIndex].id}",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Color.fromRGBO(237, 41, 57, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                            height: 0.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            "From",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, right: 25.0),
                          child: Text(
                            "${order[orderHistoryController.orderIndex].fromAddress}",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                            height: 0.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            "Delivery Address",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, right: 25.0),
                          child: Text(
                          "${order[orderHistoryController.orderIndex].deliveryAddress}",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                            height: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                 // height: displayHeight(context) * 0.3,
                 // width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 24.0, right: 22.0,bottom:20),
                    child: Column(
                      children: [

                        ListView.builder(
                          itemCount: order[orderHistoryController.orderIndex].products.length,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            final product= order[orderHistoryController.orderIndex].products[index];
                          return  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blackboldstyle(),
                              ),
                            ),
                            Text(
                              product.quantity.toString()+"x",
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blackboldstyle(),
                              ),
                            ),
                            Text(
                              product.productPrice.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blackboldstyle(),
                              ),
                            ),
                          ],
                        );
                   
                        })),
                         
                       
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                            height: 0.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                            Text(
                               order[orderHistoryController.orderIndex].orderSubtotal.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee",
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                            Text(
                             order[orderHistoryController.orderIndex].fee.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Incl.Tax",
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                            Text(
                               order[orderHistoryController.orderIndex].tax.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blacksmallboldstyle(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 14.0),
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                            height: 0.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total (Incl.Gst)",
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blackboldlightstyle(),
                              ),
                            ),
                            Text(
                              order[orderHistoryController.orderIndex].orderTotal.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: Constants.blackboldlightstyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
     // ),
    );
  }
}
