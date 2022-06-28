import 'package:customer/controller/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../widgets/tab_bar_view.dart';
import 'orderdetails.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  getOrderHistory() async {
    await orderHistoryController.getOrderHistory();
  }

  @override
  void initState() {
    // TODO: implement initState
    getOrderHistory();
  }

  OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: OrderHistoryController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () async {
                             Get.back();
                            },
                            child: Image.asset(
                              "assets/images/arrow_back.png",
                              width: 25,
                            )),
                        SizedBox(
                          width: displayWidth(context) * 0.25,
                        ),
                        Text(
                          "Order History",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
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

                  orderHistoryController.isLoading == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 220.0),
                                          child: Center(
                                              child: SpinKitFadingFour(
                                            color: Colors.black,
                                            size: 40,
                                          ))):
                                          
                            
                               orderHistoryController.orderHistoryModel.orders.isBlank ||
                                   orderHistoryController.orderHistoryModel.orders.isEmpty
                            //  orderController.orderListModel.data.isBlank ||
                            //         orderController.orderListModel.data.isEmpty

                                ? const Padding(
                                    padding: EdgeInsets.only(top: 200),
                                    child: Center(
                                      child: Text(
                                        "Orders not availabe!",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  )
                                          
                                          : ListView.builder(
                      shrinkWrap: true,
                      //itemCount: 5,
                      itemCount: orderHistoryController
                          .orderHistoryModel.orders.length,
                      physics: ScrollPhysics(),
                      itemBuilder: ((context, index) {
                        final order = orderHistoryController
                            .orderHistoryModel.orders[index];

                        return GestureDetector(
                          onTap: () {
                            orderHistoryController.setOrderIndex(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetails()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: displayHeight(context) * 0.14,
                            width: displayWidth(context) / 1.17,
                            decoration: Constants.containerstyle(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //"name",
                                        "${order.name}",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ListView.builder(
                                                //  itemCount: 2,
                                                itemCount:
                                                    order.products.length,
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: ((context, index) {
                                                  final product =
                                                      order.products[index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "${product.name}, ",
                                                      // "rice",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Color.fromRGBO(
                                                            154, 154, 157, 1),
                                                      )),
                                                    ),
                                                  );
                                                })),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        " ${order.orderDate}" + " ${order.time}",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(154, 154, 157, 1),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        //"total",
                                        "\$${order.orderTotal}",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(237, 41, 57, 1),
                                        )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            );
          }),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
