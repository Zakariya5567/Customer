import 'dart:convert';
import 'dart:io';
import 'package:customer/Models/AuthApi/UpdateUserProfile/UserProfileUpdate.dart';
import 'package:customer/Models/get_profile_model.dart';
import 'package:customer/Models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/update_profile_image_model.dart';
import '../Models/user_profile_model.dart';
import '../utills/api_url.dart';

class ProfileApi{

  UpdateProfileImageModel updateProfileImageModel;
  UpdateUserProfileModel updateUserProfileModel;
  UserProfileModel userProfileModel;
    GetProfileModel getProfileModel;



  Future<GetProfileModel>getProfileApi() async {

    print("calling getprofile api");


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String getProfileUrl = ApiUrl.getProfileUrl;

     print(getProfileUrl);

    var response = await http.post(Uri.parse(getProfileUrl),headers: headers);

    //print("Response is: ${response.body}");

    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    getProfileModel =
        GetProfileModel.fromJson(decodeResponse);
    print("decode respose is: ${decodeResponse}");

    return getProfileModel;
  }

  
  getUserProfileApi()
      async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    //  final headers = {
    //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjBmNTY3NjhjMzY3MjZlOGZhYjg4YThmNWRiYmIzNzkxMGE0YTZhZTJiMmMyZmQ5NmM3ZGQ2ZDQ4MDRhZjhhZTg3NjI3ZjAzMmYxMzliNDMiLCJpYXQiOjE2NTI2ODMxODkuODc0NzExLCJuYmYiOjE2NTI2ODMxODkuODc0NzE0LCJleHAiOjE2Njg1ODA3ODkuODczMjQ4LCJzdWIiOiIxODUiLCJzY29wZXMiOltdfQ.QQ8kswtoRIlBZg5ZURriPftjKkBfx6fT5l6V3lE_Oq_b1OY_9SIaACWARzf4WzwzHXZX4XninEJ0iFIwHbZfb_VCgz1qYBSjKl2zVyPc5xJhXQCDyi-_fL0DGlPhu1w3MWOCt4Nycvxrk4lTx5QHYNi_eMse5SlCOMpgBPwRRY3M6tcLKeWtVG5MojFKkacrrTXLhA24ACeUtahREcPcjNcdYY7tvmj9ePTGCTVq9nc8XXt1I_2bOShNkC4p2NEyLdgeTKJMiMoIZBNcKcQc2d91By822mHalZuGr20TaO5lw71y_4tS_m4q8q7z2yxO4kAQhBSZ4lO2UgyiTg-3dBjZNmT7DIYtNL5ZvVoTHdXg_c3cF1bnfjfVMls4v92JP3zAdICLlNnGw5hzTMuM5OLJDueq2inb1fmXn3rH7Xbx91mSe6AUbhyCUclwyWW_ZvE0zfBpXzdjVXM2yZF6hotICq7S0pQlrUbR-m-ayp2LDdcQbSWydSKgXXn3jaKsONSLQz0aJv-lCM-V4Ofm6ENYNfBKC20r6gxG3DU-kLdwuKKnh4dQbKv6zjlHsmeumLzszLaigmmUPKNtwM-RNyfYTmI7o7pYW2fEOfXdA-CU6HodQ_upK0iBct8NFRrctdF3TgFd1RfbJXRwpMUW10iL3zD-4oebUfnPkN3UaBU'
    // };

    String userProfileUrl = ApiUrl.userProfileUrl;

    print(userProfileUrl);

    var response = await http.post(Uri.parse(userProfileUrl),
        headers: headers);

    final responseBody = response.body;

    final decodeResponse = jsonDecode(responseBody);
    userProfileModel =
        UserProfileModel.fromJson(decodeResponse);
    print(decodeResponse);

    return userProfileModel;
  }


  Future<UpdateProfileImageModel> updateProfileImageApi(File imagePath,) async {

    print("image path in api is :$imagePath");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

  
  final headers = {
      'Authorization': 'Bearer $accessToken',
    };
  // final headers = {
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWM3MjI3NTljMWJkYjc4MjIxMDQwZTdiZjY5MDhlY2EwM2NkZWNjMGQ0YjVjZTJlOTkyYWM0MjE4Zjc1ODljYTgzOGIzOTE2NWFjZjc0ZTciLCJpYXQiOjE2NTM1NTQ2NDUuOTczNjc5LCJuYmYiOjE2NTM1NTQ2NDUuOTczNjg0LCJleHAiOjE2Njk0NTIyNDUuOTcxNzUyLCJzdWIiOiIxOTMiLCJzY29wZXMiOltdfQ.LcMXhKxmVfjxfJ63RgCmbv9ee5Pq148D2wLfcC6plHbGZdLwew0sTI_XJEtGEsinuJB1YrwYjIHGZdWuBE2x3j2bnRn54gKReK1c1xC6T8qdvGtDKjff11cj8m_Pme4z9PP_1RPSagskSrDMIKmhw_QtyYn29F9xZX4lnrFgQEGQFUsk-4xiIhNEIXnl6yfj6QknIRYjAtTmJTsmSRSzdqGEuYeKZJd760nPXoB87BoS-21KuE8SbMN11-s1Guf508vBAlSAPm_lOLZyevBG-lJtKukA7L47jk_C2N0zqfUkPQf8ZaaXaZnBlABTIW3Krf_qeuEC_XuPbgo5vc30YU1vFVkKiM45TQkbb1WD4OKMOwGIX6y2QzVOuD_r_GN0tbpaZ_sczcyy80-YYZzSdzahsnZ91f9OwJ5CZ2yAgWV10OlQxIt4o_yY1yXEx4DX_UZP-fCzJljh2wo08r6c-U-jbWAaI2WOEgVHKex89HFKCfHBz4fgteVOcXF1uyk0cvDf3oIzOFNObYhFnzHqftTRL9fs-yolLT1wo9EbcnM9oyUxtzXGgUutIKO9Qf2BiAFpxpLXeNgkGqmfVOP_f1TXET1dLAUaG-flFiWwOhctYhqImsdIN860qbnM7cEsJM3ctrUJqblUX8mxav83uPChimLeIx4Q1KM4i-SXulo',
  //   };

    print("barear token is :$accessToken");

    String updateprofileImageUrl = ApiUrl.updateProfileImgeUrl;

    print(updateprofileImageUrl);


    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(updateprofileImageUrl),
    );
    request.headers.addAll(headers);

    //create multipart using filepath, string or bytes
    var pic =
        await http.MultipartFile.fromPath("profile_img", imagePath.path);

    //add multipart to request
    request.files.add(pic);

    var response = await request.send();

    //Get the response from the server

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print("responseString is: $responseString end response");

    var decodeResponse = jsonDecode(responseString);

    print("Decode response is $decodeResponse");

    updateProfileImageModel = UpdateProfileImageModel.fromJson(decodeResponse);

    return updateProfileImageModel;
  }


 Future<UpdateUserProfileModel> updateUserProfileApi(
      Map<String, dynamic> data) 

      async {

        print("sending data is $data");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    // final headers = {
    //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWM3MjI3NTljMWJkYjc4MjIxMDQwZTdiZjY5MDhlY2EwM2NkZWNjMGQ0YjVjZTJlOTkyYWM0MjE4Zjc1ODljYTgzOGIzOTE2NWFjZjc0ZTciLCJpYXQiOjE2NTM1NTQ2NDUuOTczNjc5LCJuYmYiOjE2NTM1NTQ2NDUuOTczNjg0LCJleHAiOjE2Njk0NTIyNDUuOTcxNzUyLCJzdWIiOiIxOTMiLCJzY29wZXMiOltdfQ.LcMXhKxmVfjxfJ63RgCmbv9ee5Pq148D2wLfcC6plHbGZdLwew0sTI_XJEtGEsinuJB1YrwYjIHGZdWuBE2x3j2bnRn54gKReK1c1xC6T8qdvGtDKjff11cj8m_Pme4z9PP_1RPSagskSrDMIKmhw_QtyYn29F9xZX4lnrFgQEGQFUsk-4xiIhNEIXnl6yfj6QknIRYjAtTmJTsmSRSzdqGEuYeKZJd760nPXoB87BoS-21KuE8SbMN11-s1Guf508vBAlSAPm_lOLZyevBG-lJtKukA7L47jk_C2N0zqfUkPQf8ZaaXaZnBlABTIW3Krf_qeuEC_XuPbgo5vc30YU1vFVkKiM45TQkbb1WD4OKMOwGIX6y2QzVOuD_r_GN0tbpaZ_sczcyy80-YYZzSdzahsnZ91f9OwJ5CZ2yAgWV10OlQxIt4o_yY1yXEx4DX_UZP-fCzJljh2wo08r6c-U-jbWAaI2WOEgVHKex89HFKCfHBz4fgteVOcXF1uyk0cvDf3oIzOFNObYhFnzHqftTRL9fs-yolLT1wo9EbcnM9oyUxtzXGgUutIKO9Qf2BiAFpxpLXeNgkGqmfVOP_f1TXET1dLAUaG-flFiWwOhctYhqImsdIN860qbnM7cEsJM3ctrUJqblUX8mxav83uPChimLeIx4Q1KM4i-SXulo',
    // };

    String updateUserProfileUrl = ApiUrl.updateProfileUrl;

    print(updateUserProfileUrl);

    var response = await http.post(Uri.parse(updateUserProfileUrl),
        body: data, headers: headers);

    final responseBody = response.body;

    print("response is $responseBody");

    final decodeResponse = jsonDecode(responseBody);
    updateUserProfileModel =
        UpdateUserProfileModel.fromJson(decodeResponse);
    print(decodeResponse);

    return updateUserProfileModel;
  }


}