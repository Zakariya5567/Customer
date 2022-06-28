import 'dart:convert';
import 'dart:io';
import 'package:customer/Models/restaurant_detail_model.dart';
import 'package:customer/Models/user_dashboard_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utills/api_url.dart';

class RestaurantDetailApi {

  RestaurantDetailModel restaurantDetailModel;

  
  getrestaurantDetailApi(Map<String,dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    print("calling api");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    //  final headers = {
    //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWM3MjI3NTljMWJkYjc4MjIxMDQwZTdiZjY5MDhlY2EwM2NkZWNjMGQ0YjVjZTJlOTkyYWM0MjE4Zjc1ODljYTgzOGIzOTE2NWFjZjc0ZTciLCJpYXQiOjE2NTM1NTQ2NDUuOTczNjc5LCJuYmYiOjE2NTM1NTQ2NDUuOTczNjg0LCJleHAiOjE2Njk0NTIyNDUuOTcxNzUyLCJzdWIiOiIxOTMiLCJzY29wZXMiOltdfQ.LcMXhKxmVfjxfJ63RgCmbv9ee5Pq148D2wLfcC6plHbGZdLwew0sTI_XJEtGEsinuJB1YrwYjIHGZdWuBE2x3j2bnRn54gKReK1c1xC6T8qdvGtDKjff11cj8m_Pme4z9PP_1RPSagskSrDMIKmhw_QtyYn29F9xZX4lnrFgQEGQFUsk-4xiIhNEIXnl6yfj6QknIRYjAtTmJTsmSRSzdqGEuYeKZJd760nPXoB87BoS-21KuE8SbMN11-s1Guf508vBAlSAPm_lOLZyevBG-lJtKukA7L47jk_C2N0zqfUkPQf8ZaaXaZnBlABTIW3Krf_qeuEC_XuPbgo5vc30YU1vFVkKiM45TQkbb1WD4OKMOwGIX6y2QzVOuD_r_GN0tbpaZ_sczcyy80-YYZzSdzahsnZ91f9OwJ5CZ2yAgWV10OlQxIt4o_yY1yXEx4DX_UZP-fCzJljh2wo08r6c-U-jbWAaI2WOEgVHKex89HFKCfHBz4fgteVOcXF1uyk0cvDf3oIzOFNObYhFnzHqftTRL9fs-yolLT1wo9EbcnM9oyUxtzXGgUutIKO9Qf2BiAFpxpLXeNgkGqmfVOP_f1TXET1dLAUaG-flFiWwOhctYhqImsdIN860qbnM7cEsJM3ctrUJqblUX8mxav83uPChimLeIx4Q1KM4i-SXulo',
    // };

    

    String restautrantDetailUrl = ApiUrl.restautrantDetailUrl;

    print(restautrantDetailUrl);

    var response = await http.post(Uri.parse(restautrantDetailUrl),body: data, headers: headers);

    final responseBody = response.body;

    final decodeResponse = jsonDecode(responseBody);

    restaurantDetailModel = RestaurantDetailModel.fromJson(decodeResponse);
    print(decodeResponse);

    return restaurantDetailModel;
  }
  
}
