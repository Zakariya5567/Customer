import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/login_api_model.dart';
import '../services/login_api.dart';

class LoginController extends GetxController {

  //login controller class is used for login 
  // loginpimodel is the instance of the login model class
  // loginApi a class contain api calling functions

  LoginApiModel loginApiModel;
  LoginApi loginApi = LoginApi();

 //user type 1 is customer
  //user type 2 is rider
  //setuser type function is user to set the user type 1 or 2
   bool isLoading;
  int userType;

  setUserType(int type){
    userType=type;
    print("set user type is :$userType");
    update();
  }

  setLoading(bool value){
    isLoading=value;
    update();
  }

   // User login function is used to to call login api method and store the response 
   // in login model class

  userLogin(String phone, String firebaseToken, String currentTimeZone) async {

    //map data is the required api data
    loginApiModel = await loginApi.loginApi(
      {
        "user_type": '1',
        "phone_number": phone,
        "fcm_token": firebaseToken,
        "timezone": currentTimeZone,
      },
    );


   // shared preferences is used to store the data which is mostly requied in other screen
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("fcm_token", loginApiModel.user.fcmToken);
    sharedPreferences.setString("access_token", loginApiModel.token.accessToken);
    sharedPreferences.setInt("user_type", loginApiModel.user.userType);
    sharedPreferences.setInt("userId",loginApiModel.user.userId);
    
  
    print("userId is :${loginApiModel.user.userId}"); 
    print("fcm_token is :${loginApiModel.user.fcmToken}"); 
    print("access_token is :${loginApiModel.token.accessToken}"); 
    print("user_type is :${loginApiModel.user.userType}"); 
    
  }
}
