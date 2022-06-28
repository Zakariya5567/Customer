import 'package:customer/controller/dashboard_controller.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PopularItems extends StatelessWidget {
  PopularItems ({Key key}) : super(key: key);

  DashboardController dashboardController=Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) {
        return Container(
                            height: displayHeight(context) * 0.180,

                            // width: displayWidth(context) / 1.17,
                            // margin:
                            //   EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 
                                //10,
                                dashboardController.userDashboardModel.popularProductsList.length,
                                itemBuilder: ((context, index) {
                                final popular=dashboardController.userDashboardModel.popularProductsList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: displayHeight(context) * 0.200,
                                      width: displayWidth(context) / 3.5,
                                      decoration: BoxDecoration(
                                           color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: 
                                              // AssetImage(
                                              //     "assets/images/foodimages/slider_image1.png")

                                              NetworkImage(popular.image)

                                                  )),
                                    ),
                                  );
                                })));
      }
    );

    
  }
}