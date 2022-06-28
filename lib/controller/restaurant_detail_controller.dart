import 'dart:io';
import 'package:customer/Models/restaurant_detail_model.dart';
import 'package:customer/Models/user_dashboard_model.dart';
import 'package:customer/services/dashboard_api.dart';
import 'package:customer/services/restaurant_detail_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDetailController extends GetxController {



  RestaurantDetailModel restaurantDetailModel;
  RestaurantDetailApi restaurantDetailApi=RestaurantDetailApi();

   bool isLoading;
   int serviceId;
   int currentIndex;

   setIndex(int index){
     currentIndex=index;
     update();
   }
   
   setServiceId(int value){
     serviceId=value;
     print("service id is $serviceId");
     update();
   }

   setLoading(bool value){
    isLoading=value;
     update();
   }


  getrestaurantDetail(String companyId) async {

    print('company services calling');


    restaurantDetailModel = await restaurantDetailApi.getrestaurantDetailApi({
      "company_id":companyId
    });
    

    update();
  }
  
}
