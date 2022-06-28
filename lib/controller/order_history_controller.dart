import 'dart:io';
import 'package:customer/Models/order_history_model.dart';
import 'package:customer/Models/restaurant_detail_model.dart';
import 'package:customer/Models/user_dashboard_model.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/profile_controller.dart';
import 'package:customer/services/dashboard_api.dart';
import 'package:customer/services/restaurant_detail_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/order_history_controller.dart';

class OrderHistoryController extends GetxController {

LoginController loginController=Get.put(LoginController());
ProfileController profileController=Get.put(ProfileController());
  OrderHistoryModel orderHistoryModel;
  OrderHistoryApi orderHistoryApi=OrderHistoryApi();

   bool isLoading;
   int orderIndex;
  // int subtotal;

   setLoading(bool loading){
     isLoading=loading;
     update();
   }

  //  setSubtotal(){
  //    subtotal=0;
  //    for(int i;i<orderHistoryModel.orders[orderIndex].products.length;i++){
  //      subtotal=subtotal+orderHistoryModel.orders[orderIndex].products[i].productPrice*
  //      orderHistoryModel.orders[orderIndex].products[i].quantity;
  //    }
  //    return subtotal;
  //  }

   setOrderIndex(int index){
     orderIndex=index;
     print(index);
     update();
   }
   
//calling api to get order history of the user

  getOrderHistory() async {

    SharedPreferences pref=await SharedPreferences.getInstance();

    int userId = pref.getInt("userId");

    print('company services calling');

    orderHistoryModel  =  await orderHistoryApi.getorderHistoryApi({
      "customer_id":userId.toString()
    });
    

    update();
  }
  
}
