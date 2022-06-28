import 'dart:io';

import 'package:customer/Models/user_dashboard_model.dart';
import 'package:customer/services/dashboard_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {


// dashboard controller is a controller of  dashboad user to call api of dashbord
//and update time by time dashboard when change occurs

  UserDashboardModel userDashboardModel;
  DashboardApi dashboardApi=DashboardApi();


   bool isLoading;

   setLoading(bool value){
    isLoading=value;
     update();
   }

// this fuction is use to call api function and store the api data in model class
  getuserDashboard() async {

    print('dashboard calling');


    userDashboardModel = await dashboardApi.getuserDashboardApi();
    

    update();
  }
  
}
