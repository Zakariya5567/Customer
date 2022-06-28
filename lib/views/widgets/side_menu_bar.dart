import 'package:customer/controller/order_history_controller.dart';
import 'package:customer/controller/profile_controller.dart';
import 'package:customer/views/pages/accountSetting/accountSetting.dart';
import 'package:customer/views/pages/firstScreen/splash_screen.dart';
import 'package:customer/views/pages/myOrder/orderHistory.dart';
import 'package:customer/views/pages/walletPage/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenuBar extends StatelessWidget {
  SideMenuBar({Key key}) : super(key: key);

  OrderHistoryController orderHistoryController=Get.put(OrderHistoryController());
  ProfileController profileController=Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(10.0), children: [
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //close icon
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: ImageIcon(
                      AssetImage("assets/images/close.png"),
                      
                    ),
                  ),
                
                //Wallet
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("WALLET",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        Text("\$ 87.00",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                      ],
                    ),
                    onTap: () async {
                         Navigator.pop(context);
                         Get.to(WalletPage(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                    },
                  ),
               Divider(
                    height: 1,
                  ),
                // Account setting
                  ListTile(
                    title: Text("ACCOUNT SETTING",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    onTap: () async {

                      
                        orderHistoryController.setOrderIndex(4);
                                
                        profileController.setLoading(true);
                          Navigator.pop(context);
                        Get.to(AccountSetting(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                        await profileController.getProfile();
                         profileController.setLoading(false);

                         
                    },
                  ),
                  Divider(
                    height: 1,
                  ),

                // Order history  
                  ListTile(
                    title: Text("ORDER HISTORY",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    onTap: () async {
                        orderHistoryController.setOrderIndex(1);
                              orderHistoryController.setLoading(true);
                                Navigator.pop(context);
                              Get.to(OrderHistory());
                              await orderHistoryController.getOrderHistory();
                              orderHistoryController.setLoading(false);
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                // Need help 
                  ListTile(
                    title: Text("NEED HELP?",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    onTap: () async {},
                  ),
                Divider(
                    height: 1,
                  ),
                 // Terms and condition
                  ListTile(
                    title: Text("TERMS AND CONDITION",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    onTap: () async {},
                  ),

                 Divider(
                    height: 1,
                  ),
                  //log out 
                  ListTile(
                    title: Text("LOGOUT",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      await sharedPreferences.setBool("isLogin", false);
                      Navigator.pop(context);
                      Get.offAll(FirstScreen());
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
