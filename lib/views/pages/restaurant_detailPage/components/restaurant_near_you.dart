import 'package:customer/controller/order_controller.dart';
import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/utills/api_url.dart';
import 'package:customer/views/pages/order_page/productpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../order_page/addtoCart.dart';

class RestaurantNearYouItem extends StatelessWidget {
  RestaurantNearYouItem({Key key}) : super(key: key);

  RestaurantDetailController restaurantDetailController =
      Get.put(RestaurantDetailController());
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RestaurantDetailController(),
        builder: (controller) {
          return Container(

              // height: displayHeight(context) * 0.200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: restaurantDetailController
                      .restaurantDetailModel.productsList.length,
                  itemBuilder: ((context, index) {
                    print(
                        "res product id: ${restaurantDetailController.serviceId}");
                    final product = restaurantDetailController
                        .restaurantDetailModel.productsList[index];
                    final restaurant = restaurantDetailController
                        .restaurantDetailModel.restaurant;
                    print("prodcut id: ${product.serviceId}");
                    return restaurantDetailController.serviceId == null
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: (() async {
   
                                 if (orderController.productIdList
                                    .contains(product.productId)) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.black87,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(10),
                                                    right: Radius.circular(10)),
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

                                  orderController.setProductName(product.name);

                                  orderController
                                      .setProductPrice(product.originalPrice);

                                  orderController.setProductQuantity();

                                  orderController
                                      .setProductShortDesc(product.shortDesc);

                                  orderController.setFee(restaurant.fee == null
                                      ? 0
                                      : restaurant.fee);
                                  orderController.setTax(restaurant.tax == null
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
                                height: displayHeight(context) * 0.180,
                                width: displayHeight(context) * 0.340,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: displayHeight(context) * 0.280,
                                        width: displayWidth(context) / 3.2,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image:
                                                    //  AssetImage(
                                                    //     "assets/images/foodimages/slider_image1.png")

                                                    NetworkImage(
                                                        "${product.imagePath}"))),
                                        child: Stack(
                                          children: [
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Image.asset(
                                                      "assets/images/love.png",
                                                      scale: 23,
                                                    ),
                                                  ),
                                                )),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
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
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name??"",
                                                maxLines: 1,
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                //"flutter silentsol letsride customer appsrc master",
                                                product.shortDesc??"",
                                                maxLines: 2,
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                "Rs ${product.originalPrice}"??"",
                                                maxLines: 1,
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              InkWell(
                                                onTap: (() async {
                                                  if (orderController
                                                      .productIdList
                                                      .contains(
                                                          product.productId)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.black87,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.horizontal(
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
                                                   

                                                    orderController
                                                        .setProductId(
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

                                                    orderController
                                                        .setCompanyId(
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "ADD TO CART",
                                                      style: GoogleFonts.ubuntu(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
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
                            ),
                          )
                        : product.serviceId ==
                                restaurantDetailController.serviceId
                            ? Padding(
                                padding: const EdgeInsets.all(10),
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
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(10),
                                                        right: Radius.circular(
                                                            10)),
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

                                      orderController.setProductPrice(
                                          product.originalPrice);

                                      orderController.setProductQuantity();

                                      orderController.setProductShortDesc(
                                          product.shortDesc);

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
                                    height: displayHeight(context) * 0.180,
                                    width: displayHeight(context) * 0.340,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade200),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height:
                                                displayHeight(context) * 0.280,
                                            width: displayWidth(context) / 3.2,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image:
                                                        //  AssetImage(
                                                        //     "assets/images/foodimages/slider_image1.png")

                                                        NetworkImage(
                                                            "${product.imagePath}"))),
                                            child: Stack(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image.asset(
                                                          "assets/images/love.png",
                                                          scale: 23,
                                                        ),
                                                      ),
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Image.asset(
                                                        "assets/images/foodimages/halal_logo.png",
                                                        scale: 1.5,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name??"",
                                                    maxLines: 1,
                                                    style: GoogleFonts.ubuntu(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    //"flutter silentsol letsride customer appsrc master",
                                                    product.shortDesc??"",
                                                    maxLines: 2,
                                                    style: GoogleFonts.ubuntu(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    "Rs ${product.productId}"??"",
                                                    maxLines: 1,
                                                    style: GoogleFonts.ubuntu(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  InkWell(
                                                    onTap: (() async {
                                                      if (orderController
                                                          .productIdList
                                                          .contains(product
                                                              .productId)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black87,
                                                                    shape:
                                                                        const RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.horizontal(
                                                                          left: Radius.circular(
                                                                              10),
                                                                          right:
                                                                              Radius.circular(10)),
                                                                    ),
                                                                    content:
                                                                        SizedBox(
                                                                      height:
                                                                          MediaQuery.of(context).size.height /
                                                                              9,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Product Already added ',
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    )));
                                                      } else {
                                                        

                                                        orderController
                                                            .setProductId(
                                                                product
                                                                    .productId);

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
                                                                product
                                                                    .shortDesc);

                                                        orderController.setFee(
                                                            restaurant.fee ==
                                                                    null
                                                                ? 0
                                                                : restaurant
                                                                    .fee);
                                                        orderController.setTax(
                                                            restaurant.tax ==
                                                                    null
                                                                ? 0
                                                                : restaurant
                                                                    .tax);

                                                        orderController
                                                            .setCompanyId(
                                                                product
                                                                    .companyId);
                                                        orderController
                                                            .addproductList();
                                                            
                                                        orderController
                                                            .cartProduct
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
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.040,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "ADD TO CART",
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                ),
                              )
                            : SizedBox(
                                height: 0,
                              );
                  })));
        });
  }
}
