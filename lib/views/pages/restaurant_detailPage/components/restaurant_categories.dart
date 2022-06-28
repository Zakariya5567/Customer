import 'dart:ui';

import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorisList extends StatelessWidget {
   CategorisList({Key key}) : super(key: key);
  //CompanyServicesController companyServicesController=Get.put(CompanyServicesController());
  RestaurantDetailController restaurantDetailController=Get.put(RestaurantDetailController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RestaurantDetailController(),
      builder: (conttoller) { 
        return Container(
            height: displayHeight(context) * 0.095,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurantDetailController.restaurantDetailModel.categoriesList.length,
                itemBuilder: ((context, index) {
                  final category=restaurantDetailController.restaurantDetailModel.categoriesList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        TextButton(
                          
                          child: Text(

                          category.name,
                          style: GoogleFonts.ubuntu(
                            textStyle:  TextStyle(
                                
                                fontSize: 16,
                                color: restaurantDetailController.currentIndex==category.productId?
                                 Colors.red[400]: Colors.black87,
                                 fontWeight: FontWeight.w600),
                          ),
                          textAlign: TextAlign.start,
                        ),
                          onPressed: () async{

                             restaurantDetailController.setIndex(category.productId);

                             restaurantDetailController.setServiceId(category.serviceId);

                             //companyServicesController.getCompanyServices("149");
                            
                          },
                          
                        ),
                        Container(height: 2,width:MediaQuery.of(context).size.width*0.15 ,
                         color: restaurantDetailController.currentIndex==category.productId?
                                 Colors.red[400]: Colors.white70,
                        )
                      ],
                    )
                    
                    
                    
                  );
                })));
      }
    );
  }
}
