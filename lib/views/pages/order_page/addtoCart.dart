import 'package:customer/controller/order_controller.dart';
import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/services/restaurant_detail_api.dart';
import 'package:customer/views/pages/order_page/productpage.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../../utills/customtextbutton.dart';
import 'checkoutpage.dart';

import 'package:customer/utills/api_url.dart';

class AddToCart extends StatelessWidget {
  RestaurantDetailController restaurantDetailController =
      Get.put(RestaurantDetailController());
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "CART",
          style: GoogleFonts.ubuntu(
            textStyle:const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
         centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.to(ProductPage());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: GetBuilder(
          init: RestaurantDetailController(),
          builder: (controller) {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                
                  //trending list
                  Container(
                      height: displayHeight(context) * 0.30,
                      //  width: displayWidth(context) / 1.17,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: ListView.builder(
                          itemCount: restaurantDetailController
                              .restaurantDetailModel.productsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            final product = restaurantDetailController
                                .restaurantDetailModel.productsList[index];
                            final restaurant = restaurantDetailController
                                .restaurantDetailModel.restaurant;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (() async {
                                  //orderController.addproductList();
                                  // orderController.cartProduct
                                  //     .forEach((element) {
                                  //   orderController.setProductIdList(
                                  //       element["product_id"]);
                                  // });

                                  if (orderController.productIdList
                                      .contains(product.productId)) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.black87,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(10),
                                                      right:
                                                          Radius.circular(10)),
                                            ),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  9,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Center(
                                                child: Text(
                                                  'Product Already added ',
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            )));
                                  } else {
                                    orderController
                                        .setProductImage(product.imagePath);

                                    orderController
                                        .setProductId(product.productId);

                                    orderController
                                        .setProductName(product.name);

                                    orderController
                                        .setProductPrice(product.originalPrice);

                                    orderController.setProductQuantity();

                                    orderController
                                        .setProductShortDesc(product.shortDesc);

                                    orderController.setFee(
                                        restaurant.fee == null
                                            ? 0
                                            : restaurant.fee);
                                    orderController.setTax(
                                        restaurant.tax == null
                                            ? 0
                                            : restaurant.tax);

                                    orderController
                                        .setCompanyId(product.companyId);

                                    orderController.setproductSubtotal(
                                        orderController.cartProduct.length);

                                    orderController.setProductTotalprice();

                                    Get.to(ProductPage());
                                  }
                                }),
                                child: Container(
                                  width: displayWidth(context) / 2.2,
                                  // width: 160.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Image.asset("assets/images/foodimages/food1.png"),

                                      Container(
                                        height: displayHeight(context) * 0.12,
                                        // width: displayWidth(context) / 3.2,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    "${product.imagePath}"))),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 5),
                                        child: Text(
                                          "Trending Now",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Text(
                                          product.name ?? "",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          )),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0, top: 5),
                                        child: Text(
                                          product.shortDesc ?? "",
                                          maxLines: 1,
                                          style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, top: 5, right: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$ ${product.originalPrice}" ??
                                                  "",
                                              style: GoogleFonts.ubuntu(
                                                textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (() async {
                                                if (orderController
                                                    .productIdList
                                                    .contains(
                                                        product.productId)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          backgroundColor:
                                                              Colors.black87,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            10),
                                                                    right: Radius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          content: SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                9,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            child: Center(
                                                              child: Text(
                                                                'Product Already added ',
                                                                style: GoogleFonts.ubuntu(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          )));
                                                } else {
                                                  orderController.setProductId(
                                                      product.productId);

                                                  orderController
                                                      .setProductName(
                                                          product.name);

                                                  orderController
                                                      .setProductPrice(product
                                                          .originalPrice);

                                                  orderController
                                                      .setProductQuantity();

                                                  orderController
                                                      .setProductShortDesc(
                                                          product.shortDesc);

                                                  orderController.setFee(
                                                      restaurant.fee == null
                                                          ? 0
                                                          : restaurant.fee);
                                                  orderController.setTax(
                                                      restaurant.tax == null
                                                          ? 0
                                                          : restaurant.tax);

                                                  orderController.setCompanyId(
                                                      product.companyId);
                                                  orderController
                                                      .addproductList();

                                                  orderController.cartProduct
                                                      .forEach((element) {
                                                    orderController
                                                        .setProductIdList(
                                                            element[
                                                                "product_id"]);
                                                  });

                                                  orderController
                                                      .setproductSubtotal(
                                                          orderController
                                                              .cartProduct
                                                              .length);

                                                  orderController
                                                      .setProductTotalprice();

                                                  Get.to(AddToCart());
                                                }
                                              }),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))),

                  SizedBox(
                    height: 10,
                  ),

                  //selected product list

                  GetBuilder(
                      init: OrderController(),
                      builder: (controller) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            // height: displayHeight(context) * 0.3,
                            //width: displayWidth(context) / 1.5,
                            decoration: Constants.containerstyle(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              child: Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: ScrollPhysics(),
                                      itemCount:
                                          orderController.cartProduct.length,
                                      itemBuilder: (context, index) {
                                        final cartItem =
                                            orderController.cartProduct[index];

                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black12),
                                                  color: Colors.grey.shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                
                                              height: _height * 0.11,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: _height * 0.04,
                                                      color:
                                                          Colors.grey.shade100,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            //orderController.productName,
                                                            cartItem[
                                                                "product_name"],
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              textStyle: Constants
                                                                  .blackboldstyle(),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${cartItem["quantity"]}x",
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              textStyle: Constants
                                                                  .blackboldstyle(),
                                                            ),
                                                          ),
                                                          Text(
                                                            "\$ ${cartItem["product_price"]}",
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              textStyle: Constants
                                                                  .blackboldstyle(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // - button

                                                        GestureDetector(
                                                          onTap: () {
                                                            orderController
                                                                        .itemQuantity ==
                                                                    1
                                                                ? null
                                                                : orderController
                                                                    .decrementProductQuantity(
                                                                        index,
                                                                        cartItem[
                                                                            "quantity"]);
                                                            orderController
                                                                .setproductSubtotal(
                                                                    orderController
                                                                        .cartProduct
                                                                        .length);
                                                            orderController
                                                                .setProductTotalprice();

                                                            orderController
                                                                .setSubtotal();
                                                            orderController
                                                                .setTotalprice();
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            height: displayHeight(
                                                                    context) /
                                                                6 *
                                                                0.30,
                                                            width: displayWidth(
                                                                    context) /
                                                                16,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .red),
                                                            child: const Center(
                                                              child: Text(
                                                                "-",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        24),
                                                                // textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // + button
                                                        GestureDetector(
                                                          onTap: () {
                                                            orderController
                                                                .incrementProductQuantity(
                                                                    index,
                                                                    cartItem[
                                                                        "quantity"]);
                                                            orderController
                                                                .setproductSubtotal(
                                                                    orderController
                                                                        .cartProduct
                                                                        .length);
                                                            orderController
                                                                .setProductTotalprice();
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: displayHeight(
                                                                    context) /
                                                                6 *
                                                                0.30,
                                                            width: displayWidth(
                                                                    context) /
                                                                17,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .red),
                                                            child: const Center(
                                                              child: Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                                // textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // delete button
                                                        GestureDetector(
                                                          onTap: () {
                                                            orderController
                                                                .removeItem(
                                                                    index,
                                                                    cartItem[
                                                                        "product_id"]);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: displayHeight(
                                                                    context) /
                                                                6 *
                                                                0.30,
                                                            width: displayWidth(
                                                                    context) /
                                                                17,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .red),
                                                            child: Center(
                                                                child: Image.asset(
                                                                    "assets/images/delete.png")),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(
                                                    //       top: 5.0, bottom: 5.0),
                                                    //   child: Divider(
                                                    //     color:
                                                    //         Color.fromRGBO(0, 0, 0, 1)
                                                    //             .withOpacity(0.3),
                                                    //     height: 0.5,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub Total",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                      Text(
                                        "\$ ${orderController.productSubtotal}",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery Fee",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                      Text(
                                        //"",
                                        "\$ ${orderController.fee}",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Incl.Tax",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                      Text(
                                        //"",
                                        "\$ ${orderController.tax}",
                                        style: GoogleFonts.ubuntu(
                                          textStyle:
                                              Constants.blacksmallboldstyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 14.0),
                                    child: Divider(
                                      color: Color.fromRGBO(0, 0, 0, 1)
                                          .withOpacity(0.3),
                                      height: 0.5,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total (Incl.Gst)",
                                        style: GoogleFonts.ubuntu(
                                          textStyle: Constants.blackboldstyle(),
                                        ),
                                      ),
                                      Text(
                                        "\$ ${orderController.productTotalPrice}",
                                        style: GoogleFonts.ubuntu(
                                          textStyle: Constants.blackboldstyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),

                  //button
                  CustomTextButton(
                    buttonName: 'Review payment and address',
                    buttonTextStyle: GoogleFonts.ubuntu(
                        textStyle: Constants.loginbuttonstyle()),
                    buttoncolor: Constants.black_light,
                    height: _height * 0.078,
                    width: displayWidth(context) * 0.9,
                    highlightColor: Constants.black_light,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    textStyle: TextStyle(),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                ],
              ),
            );
            // );
          }),
    );
  }
}
