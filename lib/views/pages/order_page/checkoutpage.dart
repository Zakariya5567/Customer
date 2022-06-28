import 'package:customer/controller/order_controller.dart';
import 'package:customer/views/pages/failurePage/failurepage.dart';
import 'package:customer/views/pages/myOrder/myorder.dart';
import 'package:customer/views/pages/successPage/successpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';

enum paymentMethod { Cash, Wallet }

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  paymentMethod payment = paymentMethod.Cash;
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    String time = DateTime.now().hour.toString() +
        ":" +
        DateTime.now().minute.toString() +
        ":" +
        DateTime.now().second.toString();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: GetBuilder(
              init: OrderController(),
              builder: (controller) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: Container(
                    height: displayHeight(context),
                    width: displayWidth(context),
                    child: Column(
                      children: [
                        // app bar -----------------------------------------------------------------
                        Container(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      // Get.to(MyOrders());
                                    },
                                    child: Image.asset(
                                        "assets/images/Vector.png")),
                                SizedBox(
                                  width: displayWidth(context) * 0.1,
                                ),
                                Text(
                                  "Checkout".toUpperCase(),
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                        // --------------------------------------------------------------
                        // orderController.isLoading == true
                        //     ? const Padding(
                        //         padding: EdgeInsets.only(top: 250.0),
                        //         child: Center(
                        //             child: SpinKitFadingFour(
                        //           color: Colors.black,
                        //           size: 40,
                        //         )))
                        //     : 
                            Container(
                                height: displayHeight(context) / 1.1567,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      // Delivery address-------------------------------------------------------------
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: displayWidth(context),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Address detials row
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0,
                                                          right: 0.0,
                                                          top: 20.0,
                                                          bottom: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "DELIVERY ADDRESS",
                                                        style: GoogleFonts.ubuntu(
                                                            textStyle: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      Text(
                                                        "CHANGE",
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                textStyle:
                                                                    TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromRGBO(
                                                              237, 41, 57, 1),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // address details container

                                                Container(
                                                  child: Text(
                                                      "Unit 10, 2F, 123 Street, Toronto 3200"
                                                          .toUpperCase(),
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      1)))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          right: 30.0,
                                                          bottom: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          "Delivery Time"
                                                              .toUpperCase(),
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1)))),
                                                      Text(time,
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          237,
                                                                          41,
                                                                          57,
                                                                          1))))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

// Payment method  container------------------------------------------------------
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: displayWidth(context),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10.0,
                                                    top: 20.0,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "PAYMENT METHOD",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Text(
                                                      "+ADD",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            237, 41, 57, 1),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  width: displayWidth(context),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'CASH ON DELIVERY',
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1))),
                                                        ),
                                                        Radio(
                                                          activeColor:
                                                              Color.fromRGBO(
                                                                  237,
                                                                  41,
                                                                  57,
                                                                  1),
                                                          value: paymentMethod
                                                              .Cash,
                                                          groupValue: payment,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              payment = value;
                                                            });
                                                            orderController
                                                                .setPaymentMethod(
                                                                    "Cash on Delivery");
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  width: displayWidth(context),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'WALLET ( \$87 )',
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1))),
                                                        ),
                                                        Text(
                                                          'NO ENOUGH MONEY',
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .red)),
                                                        ),
                                                        Radio(
                                                          activeColor:
                                                              Color.fromRGBO(
                                                                  237,
                                                                  41,
                                                                  57,
                                                                  1),
                                                          value: paymentMethod
                                                              .Wallet,
                                                          groupValue: payment,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              payment = value;
                                                            });
                                                            orderController
                                                                .setPaymentMethod(
                                                                    "Wallet");
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      //Promo code-------------------------------------------------------------------
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: displayHeight(context) / 12,
                                            width: displayWidth(context),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "PROMO CODE",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Text(
                                                      "None",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                  ],
                                                ))),
                                      ),

                                      //detail and price-------------------------------------------------------------
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: displayHeight(context) / 2.5,
                                          width: displayWidth(context),
                                          margin: EdgeInsets.only(
                                              left: 0.0, right: 0.0, top: 20.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28.0,
                                                    right: 28.0,
                                                    top: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Sub Total",
                                                        style: Constants
                                                            .rowtextstyling()),
                                                    Text(
                                                      "CAD " +
                                                          orderController
                                                              .productSubtotal
                                                              .toString(),
                                                      style: Constants
                                                          .rowtextstyling(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28.0,
                                                    right: 28.0,
                                                    top: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Delivery Cost",
                                                        style: Constants
                                                            .rowtextstyling()),
                                                    Text(
                                                      "CAD " +
                                                          "${orderController.fee + orderController.tax}",
                                                      style: Constants
                                                          .rowtextstyling(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28.0,
                                                    right: 28.0,
                                                    top: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Discount",
                                                        style: Constants
                                                            .rowtextstyling()),
                                                    Text(
                                                      "CAD " +
                                                          orderController
                                                              .discount
                                                              .toString(),
                                                      style: Constants
                                                          .rowtextstyling(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: displayWidth(context) /
                                                      2 *
                                                      0.17,
                                                  right: displayWidth(context) /
                                                      2 *
                                                      0.17,
                                                ),
                                                child: Divider(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.3),
                                                  thickness: 0.5,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28.0,
                                                    right: 28.0,
                                                    top: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Total",
                                                        style: Constants
                                                            .rowtextstyling()),
                                                    Text(
                                                      "CAD " +
                                                          orderController
                                                              .productTotalPrice
                                                              .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      237,
                                                                      41,
                                                                      57,
                                                                      1))),
                                                    )
                                                  ],
                                                ),
                                              ),
// confirm order button-------------------------------------------------------
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30,
                                                    left: 20,
                                                    right: 20),
                                                child: InkWell(
                                                  onTap: (() async {

                                             // calling api

                                                    await orderController
                                                        .createOrder();
                                                  
                                                    if(orderController.rFlag == 1){
                                                      orderController.clearProductList();
                                                      Get.to(SuccessPage());
                                                    }else{
                                                      Get.to(FailurePage());

                                                    }
                                              
                                                  
                                                  
                                                  }),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    //EdgeInsets.only(left: 28, right: 28, top: 28),
                                                    height:
                                                        displayHeight(context) /
                                                            2 *
                                                            0.16,
                                                    width:
                                                        displayWidth(context),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.black),
                                                    child: Text(
                                                      "Confirm Order",
                                                      style: Constants
                                                          .loginbuttonstyle(),
                                                      // textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
