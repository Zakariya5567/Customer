import 'dart:io';

import 'package:customer/controller/profile_controller.dart';
import 'package:customer/views/pages/HomeScreen/homepagelayer.dart';
import 'package:customer/views/pages/firstScreen/splash_screen.dart';
import 'package:customer/views/rider/r_HomeScreen/r_orders.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
firebaseMessaging.getToken().then((token) {
      String firebaseToken = token;
      print("token is : $firebaseToken");
    });




  SharedPreferences pref = await SharedPreferences.getInstance();

  bool login= pref.getBool("isLogin");
  int userType= pref.getInt("user_type");

  print("login is :$login");
   print("user type is  :$userType");

  //  ProfileController profileController=Get.put(ProfileController());
  //  await profileController.getProfile();


  
   // use of device info plus package to find that the device is android or ios
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      var deviceId=iosDeviceInfo.identifierForVendor;
      pref.setString("deviceType", "ios");
      
     
    // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      var deviceId=androidDeviceInfo.androidId;
      pref.setString("deviceType", "android");

   

      
    // unique ID on Android
    
  }


  runApp(
    GetMaterialApp(
    title: "Customer App",
    home: 
    //FirstScreen(),
    login==true
        ?   HomePageLayer()
       
        :  FirstScreen(),
       

           // : ROrderPage(),
            
    debugShowCheckedModeBanner: false,
  ));
}

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _userType = 'Customer';
//   String _checkState = 'false';
//   getUserValue() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     if (pref.containsKey("userType") == true) {
//       String? user = pref.getString("userType");
//       print(user);
//       setState(() {
//         _checkState = 'true';
//       });
//       return user;
//     } else {
//       setState(() {
//         _userType = "Customer";
//         print(_userType);
//         // _checkState = 'true';
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkForUserValue();
//   }

//   checkForUserValue() async {
//     String us = await getUserValue() ?? 'Customer';
//     print(us + "after getuserVAlue");
//     setState(() {
//       _userType = us;
//       // _checkState = 'true';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User App',
//       // home: FirstScreen(),
//       home: _checkState == "false"
//           ? _userType == "Customer"
//               ? FirstScreen()
//               : R_FirstScreen()
//           : _userType == "Rider"
//               ? HomeScreen()
//               : ROrderPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
