import 'package:customer/controller/order_history_controller.dart';
import 'package:customer/views/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utills/Displaywidth.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key key}) : super(key: key);

  OrderHistoryController orderHistoryController=Get.put(OrderHistoryController());

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
                              width: 20,
                            )
                            ),
                        SizedBox(
                          width: displayWidth(context) * 0.30,
                        ),
                        Text(
                          "WALLET",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),

                 Padding(padding:EdgeInsets.only(
                   left: 15,right: 15,top: 80,
                 ), 
                 child: Container(

                   height: MediaQuery.of(context).size.height*0.08,
                   //width: ,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.black)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Balance",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black,
                              ),)),
                         Text("\$100",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.red,
                              ),)),
                       ],
                     ),
                   ),

                 ),)
                ,
                 Padding(padding:EdgeInsets.only(
                   left: 15,right: 15,top: 20,
                 ), 
                 child: Container(

                   height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.black,
                     border: Border.all(color: Colors.black)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: Text("ADD BALANCE",
                       style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),)
                       ),
                     ),
                   ),

                 ),

                 )
                ]
              )
            );
          }),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
