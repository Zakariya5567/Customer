import 'dart:convert';

import 'package:customer/Models/login_api_model.dart';
import 'package:customer/utills/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi{
  
  LoginApiModel loginApiModel;

//call api to login and pass user type, phone number and firebase token

 loginApi(Map<String, dynamic> data)async{

    // final headers = {"Content-Type": 'application/json; charset=UTF-8'};

    String loginUrl=ApiUrl.loginUrl;

    print(loginUrl);
    print("sending data is : $data");

    var response=await http.post(Uri.parse(loginUrl),body: data);    
    final responseBody = response.body;
    print(responseBody);
    final decodeResponse = jsonDecode(responseBody);
    loginApiModel = LoginApiModel.fromJson(decodeResponse);
    
    print("decodeResponse is : $decodeResponse");  
    
    return loginApiModel;
 }
}