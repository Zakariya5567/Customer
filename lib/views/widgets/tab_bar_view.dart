

import 'package:badges/badges.dart';
import 'package:customer/controller/order_controller.dart';
import 'package:customer/controller/order_history_controller.dart';
import 'package:customer/controller/profile_controller.dart';
import 'package:customer/views/pages/Favorite/favorite.dart';
import 'package:customer/views/pages/HomeScreen/homepagelayer.dart';
import 'package:customer/views/pages/accountSetting/accountSetting.dart';
import 'package:customer/views/pages/myOrder/myorder.dart';
import 'package:customer/views/pages/myOrder/orderHistory.dart';
import 'package:customer/views/pages/order_page/addtoCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarViewData extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());
  OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());
  ProfileController profileController = Get.put(ProfileController());



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrderController(),
        builder: (controller) {
          return Builder(
            builder: (context) {
              return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.14,
             
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BottomNavigationBar(
                      iconSize:MediaQuery.of(context).size.height * 0.03,
                      // fixedColor: Colors.black,
                       backgroundColor: Colors.black,
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      //  selectedItemColor: Colors.red,
                      //  unselectedItemColor: Colors.white,
                      currentIndex: orderController.currentIndex,
                       selectedIconTheme: IconThemeData(
                        color: Colors.red,
                      ),
                       unselectedIconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                      
                      items: <BottomNavigationBarItem>[
                        //home

                        BottomNavigationBarItem(
                          icon: IconButton(
                              onPressed: () {

                                orderController.setcurrentIndex(0);
                                
                                Get.to(HomePageLayer());
                              },
                              icon: Icon(
                                Icons.home_filled,
                                //color: Colors.white,
                                size: 25,
                              )),
                          label: '',
                        ),

                        //orders

                        BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () async {
                              orderController.setcurrentIndex(1);
                              orderHistoryController.setLoading(true);
                              Get.to(OrderHistory());
                              await orderHistoryController.getOrderHistory();
                              orderHistoryController.setLoading(false);
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/complete.png"),
                             // color: Colors.white,
                            ),
                          ),
                          label: '',
                        ),

                        //shopping cart

                        BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                                orderController.setcurrentIndex(2);
                            
                              orderController.cartProduct.isEmpty?
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
                                                  child: 
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                        TextSpan(
                                                          text:   'CART IS EMPTY!',
                                                          style: GoogleFonts.ubuntu(
                                                          color: Colors.red,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                         TextSpan(
                                                          text:   '\n\nPlease first `add products to cart',
                                                          style: GoogleFonts.ubuntu(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                        )
                                                        ]
                                                      ),
                                                   
                                                    ),
                                                  
                                                )))
                                      
                              :Get.to(AddToCart());
                            },
                            icon: Badge(
                              toAnimate: false,
                              shape: BadgeShape.circle,
                              badgeColor: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                              badgeContent: Text(
                                  orderController.cartProduct.length.toString(),
                                  style: TextStyle(color: Colors.white)),
                              child: ImageIcon(
                                AssetImage("assets/images/shopping-bag.png"),
                               // color: Colors.white,
                              ),
                            ),
                          ),
                          label: '',
                        ),

                        //favorite

                        BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                                orderController.setcurrentIndex(3);
                              Get.to(MyFavorite());
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/passion.png"),
                           //   color: Colors.white,
                            ),
                          ),
                          label: '',
                        ),

                        //profile

                        BottomNavigationBarItem(
                          icon: IconButton(
                              onPressed: () async{
                                  orderController.setcurrentIndex(4);
                                
                        profileController.setLoading(true);
                        Get.to(AccountSetting(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                        await profileController.getProfile();
                         profileController.setLoading(false);
                              },
                              icon: Icon(
                                Icons.person_outline_sharp,
                              //  color: Colors.white,
                                size: 25,
                              )),
                          label: '',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          );
        });
  }
}
