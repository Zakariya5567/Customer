import 'dart:io';

import 'package:customer/Models/get_profile_model.dart';
import 'package:customer/Models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/update_profile_image_model.dart';
import '../Models/user_profile_model.dart';
import '../services/profile_api.dart';

class ProfileController extends GetxController {
  ProfileApi profileApi = ProfileApi();

  UpdateProfileImageModel updateProfileImageModel;
  UpdateUserProfileModel updateUserProfileModel;
  UserProfileModel userProfileModel;
    GetProfileModel getProfileModel;

  
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController( );


  bool isloading;
  

  setLoading(bool value){
    isloading=value;
    update();
  }

   getProfile()async{

    getProfileModel=await profileApi.getProfileApi();
    
    nameController.text=getProfileModel.data.name;
    phoneNumberController.text=getProfileModel.data.phoneNo;

    update();
   }

  getUserProfile() async {
   userProfileModel = await profileApi.getUserProfileApi();
    update();
  }


   updateProfileImage( File imagePath) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final companyId = sharedPreferences.getInt("company_id");

    print("image path is :$imagePath");

    updateProfileImageModel = await profileApi.updateProfileImageApi(imagePath,);

    update();

  }

  updateUserProfile(String name, String phone) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final companyId = sharedPreferences.getInt("company_id");

    //print("company_id is : $companyId");
    print("NAME is : $name");
    print("PHONE NUMBER is : $phone");

    updateUserProfileModel = await profileApi.updateUserProfileApi({
      "name": name,
      "phone_number":phone,
    });

    update();
  }

}
