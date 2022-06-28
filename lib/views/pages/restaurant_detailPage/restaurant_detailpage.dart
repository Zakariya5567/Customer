import 'dart:ffi';

import 'package:customer/controller/dashboard_controller.dart';
import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/utills/api_url.dart';
import 'package:customer/views/pages/HomeScreen/components/ittalian.dart';
import 'package:customer/views/pages/HomeScreen/components/near_you.dart';
import 'package:customer/views/pages/HomeScreen/components/popular.dart';
import 'package:customer/views/pages/HomeScreen/components/trending.dart';
import 'package:customer/views/pages/customerpages/brandprofilepage.dart';
import 'package:customer/views/pages/order_page/productpage.dart';
import 'package:customer/views/pages/restaurant_detailPage/components/restaurant_categories.dart';
import 'package:customer/views/pages/restaurant_detailPage/components/restaurant_near_you.dart';
import 'package:customer/views/pages/restaurant_detailPage/components/restaurant_recently.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import '../../widgets/progress_status_bar_widget.dart';
import '../../widgets/tab_bar_view.dart';


class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key key}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  DashboardController dashboardController=Get.put(DashboardController());
  RestaurantDetailController restaurantDetailController=Get.put(RestaurantDetailController());

  double _currentSliderValue = 20;

  String userapitoken;
  String userType;
  _getuserapitoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userapitoken = pref.getString("user_api_token");

     userType = pref.getString("user_type");

    print("user type is : $userType");
    print("acces token is : $userapitoken");
  }

  @override
  void initState() {
    super.initState();
    _getuserapitoken();
   // getDahboard();
  }

 
  @override
  Widget build(BuildContext context) {
    return 
       Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.blue[200],
              color: Colors.grey[200]),
          child: SafeArea(
            child: GetBuilder(
              init: RestaurantDetailController(),
              builder: (controller) {
                return Scaffold(
                  body: SingleChildScrollView(
                    child: restaurantDetailController.isLoading == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 250.0),
                                          child: Center(
                                              child: SpinKitFadingFour(
                                            color: Colors.black,
                                            size: 40,
                                          ))):
                    
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding:EdgeInsets.all(10),
                        child: 
                        Container(
                          height: MediaQuery.of(context).size.height*0.11,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                               colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                   
                               image: 
                              // AssetImage(
                              //   "assets/images/foodimages/order_image.png"
                              // )
                              
                              NetworkImage(
                                
                                "${restaurantDetailController.restaurantDetailModel.restaurant.profileImg}"
                              )
                            ),
                            color: Colors.black

                          ),
                          child: Center(
                            child: Text(restaurantDetailController.restaurantDetailModel.restaurant.name,
                                   
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                      ),
                          ),
                        ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,right:10.0,bottom:10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () async{

                                    Get.back();
                                    
                                  }, icon: ImageIcon(
                                    AssetImage("assets/images/arrow_back.png")
                                  )),
                            


                                  RichText(text:TextSpan(
                                    children: [
                                      TextSpan(text:"DELIVERY:",
                                   
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                      ),
                                  TextSpan(text:"25Min",
                                   
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red[400],
                                          fontWeight: FontWeight.w600),
                                    ),
                                      ),
                                    ]
                        
                                  )) ,

                                  
                                 IconButton(onPressed: () {
                                    
                                  }, icon: ImageIcon(
                                    AssetImage("assets/images/share_icon.png")
                                  )),
                            
                                ],
                              ),
                            )
                          
                          ],
                        ),

                        // search bar--------------------------------------------

                        Container(
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.green,
                          height: displayHeight(context) * 0.050,
                          child: Text(
                            "RECENTLY",
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        RecentlyItems(),

                        SizedBox(height: 10,),
                      
                        CategorisList(),

                        SizedBox(height: 10,),

                        Divider(),
                        SizedBox(height: 10,),

                        Container(
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.green,
                          height: displayHeight(context) * 0.050,
                          child: Text(
                            "NEAR YOU",
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        RestaurantNearYouItem()  
                            
                        ],
                    ),
                  ),
                  bottomNavigationBar: TabBarViewData(),
                  
                );
              }
            ),
          ));
    
  }
}
