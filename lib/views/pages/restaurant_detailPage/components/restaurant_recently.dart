import 'package:customer/Models/addProductModel/listModel.dart';
import 'package:customer/utills/Displaywidth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/addProductModel/productModel.dart';
import '../../order_page/addtoCart.dart';
import '../../order_page/productpage.dart';

class RecentlyItems extends StatefulWidget {
  const RecentlyItems({Key key}) : super(key: key);

  @override
  State<RecentlyItems> createState() => _RecentlyItemsState();
}
 
class _RecentlyItemsState extends State<RecentlyItems> {
  ListModel listModel=ListModel();
 // ProductModel productModel;

addList()async{

  setState(() {
    listModel.data.add(ProductModel(productName: "name",
productId: 1.toString(),productPrice: 11.toString(),
quantity: 1.toString(),description: "ddd",
discountedPrice: 3.toString()));

  });


}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: displayHeight(context) * 0.200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      )),
                  height: displayHeight(context) * 0.200,
                  width: displayHeight(context) * 0.400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: displayHeight(context) * 0.280,
                        width: displayWidth(context) / 3.2,
                        decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/foodimages/slider_image1.png"))),
                   
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BRAND NAME",
                                style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "TUE MAY 18",
                                maxLines: 1,
                                style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                               RichText(text:TextSpan(
                                children: [
                                  TextSpan(text:"\$20.00 ",
                               
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red[400],
                                      fontWeight: FontWeight.w600),
                                ),
                                  ),
                              TextSpan(text:"  \$20.00",
                               
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    inherit: true,
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                                  ),
                                ]
                    
                              )) , SizedBox(
                                height: 10,
                              ),

                              InkWell(
                                onTap: (() {
                                  addList();
                                //  Get.to(ProductPage());
                                }),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.040,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                    "ADD TO CART",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    textAlign: TextAlign.center,
                                ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
