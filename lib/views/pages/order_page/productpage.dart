import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../widgets/tab_bar_view.dart';
import 'addtoCart.dart';

enum BestBeverages { Coke, Pepsi, Gormet }

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  OrderController orderController = Get.put(OrderController());

  TextEditingController instructionController = TextEditingController();

  BestBeverages _site = BestBeverages.Coke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: OrderController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  // colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),

                                  image:
                                      // AssetImage(
                                      //     "assets/images/foodimages/order_image.png")
                                      NetworkImage(
                                          orderController.productImge)),
                              color: Colors.black),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${orderController.productName}".toUpperCase(),
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${orderController.productShortDesc}",
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "\$${orderController.productPrice}",
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(237, 41, 57, 1)),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 7.5,
                          ),
                          Text(
                            "\$${orderController.productPrice + 20}",
                            style: new TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      thickness: 0.5,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor:
                                    const Color.fromRGBO(237, 41, 57, 1),
                                value: BestBeverages.Coke,
                                groupValue: _site,
                                onChanged: (BestBeverages value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                              Text(
                                '+Coke',
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                              ),
                            ],
                          ),
                          Text(
                            "\$0.0",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1))),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      thickness: 0.5,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //special instruction
                    Text(
                      "Special Instructions",
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1))),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      maxLines: 4,
                      controller: instructionController,
                      decoration: InputDecoration(
                        hintText: "e.g. no mayo",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //Buttons add to cart + -

                    Row(
                      children: [
                        GestureDetector(
                          onTap: (() async {
                            if (orderController.productIdList
                                .contains(orderController.prodcutId)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.black87,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(10),
                                            right: Radius.circular(10)),
                                      ),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                9,
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Center(
                                          child: Text(
                                            'Product Already added ',
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )));
                            } else {
                              orderController.addproductList();

                              orderController.cartProduct.forEach((element) {
                                orderController
                                    .setProductIdList(element["product_id"]);
                              });

                              orderController.setproductSubtotal(
                                  orderController.cartProduct.length);

                              orderController.setProductTotalprice();

                              Get.to(AddToCart());
                            }
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            height: displayHeight(context) / 4 * 0.30,
                            width: displayWidth(context) / 2.2,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Add to Cart",
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // - Buttons
                        GestureDetector(
                          onTap: () {
                            orderController.itemQuantity == 1
                                ? null
                                : orderController.decrementQuantity();

                            orderController.setproductSubtotal(
                                orderController.cartProduct.length);
                            orderController.setProductTotalprice();
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: displayHeight(context) / 4 * 0.40,
                            width: displayWidth(context) / 7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.red, width: 4)),
                            child: const Center(
                              child: const Text(
                                "-",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 55),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        // counter text

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "${orderController.itemQuantity}",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red)),
                          ),
                        ),

                        // + button
                        GestureDetector(
                          onTap: () {
                            orderController.incrementQuantity();

                            orderController.setproductSubtotal(
                                orderController.cartProduct.length);
                            orderController.setProductTotalprice();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: displayHeight(context) / 4 * 0.40,
                            width: displayWidth(context) / 7,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: const Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // scroll able column
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
