import 'dart:io';
import 'package:customer/Theme/Theme.dart';
import 'package:customer/controller/profile_controller.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:customer/views/pages/firstScreen/splash_screen.dart';
import 'package:customer/views/pages/walletPage/wallet_page.dart';
import 'package:customer/views/widgets/tab_bar_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../mainScreen/mainSplashScreen.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
 

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());


  File image;
  final picker = ImagePicker();
  String profileImage;
  String phoneNumber;
  String name;
  String apiToken;
  String imageUploadStatus;

    void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  Future imageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    showPicker(context);
    didChangeDependencies();
    // dependOnInheritedWidgetOfExactType();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      centerTitle: true,
      title:  Text(
                          "ACCOUNT",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
      ),
  
      body: GetBuilder(
        init: ProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: profileController.isloading == true
                                          ? const Padding(
                                              padding: EdgeInsets.only(top: 280.0),
                                              child: Center(
                                                  child: SpinKitFadingFour(
                                                color: Colors.black,
                                                size: 40,
                                              )))
                                              :
            
            Container(
              height: displayHeight(context),
              width: displayWidth(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    
                      Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: InkWell(
                                    onTap: () {
                                      showPicker(context);
                                    },
                                    child: Center(
                                      child: image != null
                                          ? CircleAvatar(
                                              radius: 60.0,
                                              child: ClipRRect(
                                                child: Image.file(
                                                  image,
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        150.0),
                                              ),
                                            )
                                          : 
                                             CircleAvatar(
                                                  radius: 60.0,
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      profileController
                                                          .getProfileModel.data.profileImage,
                                                      width: 150,
                                                      height: 150,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150.0),
                                                  ),
                                                )
                                              
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.14,
                                    right: MediaQuery.of(context).size.width*0.3,
                                    // top: displayHeight(context) * 0.243,
                                    // right: displayWidth(context) * 0.24,
                                    child: GestureDetector(
                                      onTap: () {
                                        // _displaySuccessMotionToast(context);
                                        showPicker(context);
                                      },
                                      child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                color: Colors.red[500],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Image.asset(
                                              "assets/images/Camera.png")),
                                    )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 25),
                              height: displayHeight(context) * 0.066,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: profileController.nameController,
                                decoration: InputDecoration(
                                  hintText:  "Name",
                                  
                                  border: InputBorder.none,
                                  prefixIcon: Image.asset(
                                    "assets/images/Profile.png",
                                   color: Colors.black,
                                  ),
                                  // suffixIcon: Image.asset("assets/images/Filter.png"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 25),
                              height: displayHeight(context) * 0.066,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: TextField(
                                enableInteractiveSelection: false,
                                focusNode: AlwaysDisabledFocusNode(),
                                controller:profileController.phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: "3213515431",
              
                                  border: InputBorder.none,
                                  prefixIcon:
                                      Image.asset("assets/images/Call.png",color: Colors.black,)
                                  // suffixIcon: Image.asset("assets/images/Filter.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.13,
                            ),


                   

         // walllet button           
                    InkWell(
                     onTap: ()async{

                       Get.to(WalletPage());

                     },
                    child: Container(
                      alignment: Alignment.center,
                      height: displayHeight(context) * 0.07,
                      width: displayWidth(context) * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        "WALLET",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(246, 246, 249, 1))),
                      ),
                    ),
                  ),
              
                    SizedBox(
                      height: displayHeight(context) * 0.03,
                    ),
          // update profilebutton button            
                  InkWell(
                     onTap: () async {
                            
                                if (image != null) {
                                  profileController.setLoading(true);

                                  await profileController
                                      .updateProfileImage(image);
                                  profileController.setLoading(false);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Successfully done",
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ))));

                                              image=null;
                                
                                }
                             

                                if (
                                    profileController.nameController.text.isNotEmpty &&
                                    profileController.phoneNumberController.text.isNotEmpty) {
                                      
                                  profileController.setLoading(true);

                                  await profileController.updateUserProfile(
                                      profileController.nameController.text,
                                     profileController. phoneNumberController.text);

                                  profileController.setLoading(false);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                             "Successfully done",
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ))));

                                              profileController.nameController.text=null;
                                    profileController.phoneNumberController.text=null;
                                }
                                // nameController.clear();
                              },
                    child: Container(
                      alignment: Alignment.center,
                      height: displayHeight(context) * 0.07,
                      width: displayWidth(context) * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        "UPDATE PROFILE",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(246, 246, 249, 1))),
                      ),
                    ),
                  ),
              
                  ],
                ),
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
