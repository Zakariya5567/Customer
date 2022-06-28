import 'dart:ffi';
import 'package:customer/controller/dashboard_controller.dart';
import 'package:customer/views/pages/HomeScreen/components/ittalian.dart';
import 'package:customer/views/pages/HomeScreen/components/near_you.dart';
import 'package:customer/views/pages/HomeScreen/components/popular.dart';
import 'package:customer/views/pages/HomeScreen/components/trending.dart';
import 'package:customer/views/pages/customerpages/brandprofilepage.dart';
import 'package:customer/views/pages/order_page/productpage.dart';
import 'package:customer/views/widgets/side_menu_bar.dart';
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

class HomePageLayer extends StatefulWidget {
  const HomePageLayer({Key key}) : super(key: key);

  @override
  _HomePageLayerState createState() => _HomePageLayerState();
}

class _HomePageLayerState extends State<HomePageLayer>
    with TickerProviderStateMixin {

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RangeValues _currentRangeValues = const RangeValues(0, 100);  
  TextEditingController searchController = TextEditingController();

  DashboardController dashboardController=Get.put(DashboardController());

  double _currentSliderValue = 20;

  String userapitoken;
  String userType;
 
  getDahboard()async{
    
    
    Future.delayed(Duration.zero,() async{
     dashboardController.setLoading(true); 
    await dashboardController.getuserDashboard();
     dashboardController.setLoading(false);
    },);
    
  }

  @override
  void initState() {
    super.initState();
    getDahboard();
  }

  double xoffSet = 0;
  double yoffSet = 0;
  double minuYSet = 0;
  double angle = 0;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return 
       GetBuilder(
         init: DashboardController(),
         builder: (controller) {
           return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.blue[200],
                  color: Colors.grey[200]),
                  
              child: SafeArea(
              
                child: Scaffold(
                  key: _scaffoldKey,
                  endDrawer: SideMenuBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/user_logo.png",
                                      height: 40,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: ()async {
                                  _scaffoldKey.currentState.openEndDrawer();
                                    },
                                    child: Image.asset("assets/images/Menu.png",
                                        height: 40, width: 40),
                                  ),
                                ],
                              ),
                            )
                          
                          ],
                        ),

                        //what do you want to eat and filter text

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              width: displayWidth(context) / 1.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "What do you want to eat?",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    "Filters",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red[400],
                                          fontWeight: FontWeight.w400),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              )),
                        ),

                        // search bar--------------------------------------------

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            //margin: EdgeInsets.only(left: 20, top: 25),
                            height: displayHeight(context) * 0.066,
                            width: displayWidth(context) / 1.0,
                            decoration: Constants.containerstyle(),
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search_rounded,
                                      size: 28, color: Colors.black38)
                                  //Image.asset("assets/images/Search.png"),
                                  //  suffixIcon: Image.asset("assets/images/Filter.png"),
                                  ),
                            ),
                          ),
                        ),
            //Slider ---------------------------------------------------

                       Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            // margin: EdgeInsets.only(left: 20, top: 25),
                            height: displayHeight(context) * 0.070,
                            width: displayWidth(context) / 1,
                            child: Slider(
                              activeColor: Colors.red[400],
                              inactiveColor: Colors.grey.shade500,
                              thumbColor: Colors.red,
                              value: _currentSliderValue,
                              mouseCursor: MouseCursor.uncontrolled,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.ceil().toString()+"KM",
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),

                            //BalloonSliderDemo(),
                          ),
                        ),
                      
                      dashboardController.isLoading == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 200.0),
                                          child: Center(
                                              child: SpinKitFadingFour(
                                            color: Colors.black,
                                            size: 40,
                                          ))):
                        Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                             Container(
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.green,
                          height: displayHeight(context) * 0.050,
                          child: Text(
                            "POPULAR ITEMS",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        PopularItems(),
                       
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.green,
                          height: displayHeight(context) * 0.050,
                          child: Text(
                            "TRENDING",
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        TrendingItems(),

                        SizedBox(height: 10,), 
                        
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.green,
                          height: displayHeight(context) * 0.050,
                          child: Text(
                            "ITTALIAN CUISINCE",
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),

                        IttalianItems(),

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
                       
                        NearYouItem()  
                         

                         ],
                       ),
                         
                        ],
                    ),
                  ),
                  bottomNavigationBar: TabBarViewData(),
                  
                ),
              ));
         }
       );
    
  }
}
