import 'dart:convert';
import 'dart:io';
import 'package:customer/Models/addProductModel/productModel.dart';
import 'package:customer/Models/restaurant_detail_model.dart';
import 'package:customer/Models/user_dashboard_model.dart';
import 'package:customer/controller/restaurant_detail_controller.dart';
import 'package:customer/services/create_order_api.dart';
import 'package:customer/services/dashboard_api.dart';
import 'package:customer/services/restaurant_detail_api.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/addProductModel/listModel.dart';
import '../Models/create_order_model.dart';

class OrderController extends GetxController {

  //create api model is the instance of creating order model class
  //restautant controller is the controller  of the restaurant page/classs
  //create order api class is used to call api for creating orders
  // product is a model class which are use for creating orders list which will be shown in
  //add to cart screen

  CreateOrderModel createOrderModel;
  RestaurantDetailController restaurantDetailController =Get.put(RestaurantDetailController());
  CreateOrderApi createOrderApi = CreateOrderApi();
  // OrderListModel orderListModel;
  // Product product;

  ListModel listModel = ListModel();
  ProductModel productModel;

//currentindex is used for the index of bottom navigation bar
//when the user click on the icon the index will change
//when the index change the color of the icon will be change eun time

  int currentIndex = 0;
  setcurrentIndex(int index) {
    currentIndex = index;
    print(index);
    update();
  }

  //----------------------------------------------------------------------

  bool isLoading;
  int productQuantity = 1;
  String productName;
  int productPrice;
  String productShortDesc;
  int prodcutId;
  int fee;
  int tax;
  int discount = 0;
  int subtotal;
  int totalPrice;
  int companyId;
  String productImge;
  String paymentMethod = "Cash on delivery";
  int itemQuantity = 1;
  int productSubtotal = 0;
  int productTotalPrice = 0;
  String message;
  int rFlag;
  int itemIndex;

//------------------------------------------------------------------------------
// list of cartproduct is a list which store the list of data which is shown in add to cart screen
// product id list is list of product id which is already added add to cart screen
// product id list is used when the id is already available cart screen show pop up'product already added'

  List cartProduct = [];
  List productIdList = [];
 

//add product list is function is used to add cartproduct to list  which after we 
//will passed to database
//Map is used to add data is key value pairs
  addproductList() {
   Map<String, dynamic> productData = {
      "product_name": productName,
      "product_id": prodcutId,
      "product_price": productPrice,
      "discounted_price": discount,
      "quantity": itemQuantity,
      "description": productShortDesc,
    };

//to add products to list

 cartProduct.add(productData);

    print("cart list is :${cartProduct}");
    update();
  }

//set productidlist function is used to add id list in to list which
//is currently available in listdata, the uses of this is when a user enter the same 
// product again to list is show pop up the product is already available in list
  setProductIdList(int id) {
    productIdList.contains(id) ? null : productIdList.add(id);

    print("product id list is :$productIdList");

    update();
  }

  setItemIndex(int index) {
    itemIndex = index;
    update();
  }

// this both function is used in prodcut page screen to increment or decrement 
// product quantity  
  incrementQuantity() {
    itemQuantity = itemQuantity + 1;
    update();
  }

  decrementQuantity() {
    itemQuantity = itemQuantity - 1;
    update();
  }

// this both function is used in addtocart screen to increment or decrement 
// cart product quantity 

  incrementProductQuantity(cartindex, int cartItem) {
    itemQuantity = cartItem + 1;

    cartProduct[cartindex]["quantity"] = itemQuantity;

    update();
  }

  decrementProductQuantity(cartindex, int cartItem) {
    itemQuantity = cartItem - 1;

    cartProduct[cartindex]["quantity"] = itemQuantity;

    print("index is : $cartindex");
    print("item is  : $cartItem");
    print("count is : $itemQuantity");
    update();
  }

//use to set subtotal of selcted product
  setproductSubtotal(int index) {
    print(index);
    productSubtotal = 0;
    print("initial sub is $productSubtotal");

    for (int i = 0; i < cartProduct.length; i++) {
      productSubtotal = productSubtotal +
          (cartProduct[i]["product_price"] * cartProduct[i]["quantity"]);
      print(i);
      print("index product Sub total is : $productSubtotal");
    }
    print(" Sub total is : $productSubtotal");
    update();
  }

//use to set total of selcted product
  setProductTotalprice() {
    productTotalPrice = productSubtotal + tax + fee;
    print("product Total price: $productTotalPrice");
    update();
  }

//user for loader when api is calling 
  setLoading(bool value) {
    isLoading = value;
    update();
  }

//use to set prodcut image
  setProductImage(String image) {
    productImge = image;
    update();
  }

////use to set payment method
  setPaymentMethod(String payment) {
    paymentMethod = payment;
    update();
    print("payment method: $paymentMethod");
  }

  setSubtotal() {
    subtotal = productPrice * productQuantity;
    print("Sub total: $subtotal");
    update();
  }

  setCompanyId(int id) {
    companyId = id;
    print("company id: $companyId");
    update();
  }

  setTotalprice() {
    totalPrice = productPrice * productQuantity + tax + fee;
    print("Total price: $totalPrice");
    update();
  }

  setProductName(String name) {
    productName = name;
    print("product name is : $productName");
    update();
  }

  setProductPrice(int price) {
    productPrice = price;
    print("product price : $productPrice");
    update();
  }

  setProductShortDesc(String shortDesc) {
    productShortDesc = shortDesc;
    print("product desc: $productShortDesc");
    update();
  }

  setProductId(int id) {
    prodcutId = id;
    print("product is is :$prodcutId");
    update();
  }

  setProductQuantity() {
    itemQuantity = 1;
    print("product item Quantity: $itemQuantity");
    update();
  }

  setFee(int value) {
    fee = value;
    print("fee is : $fee");
    update();
  }

  setTax(int value) {
    tax = value;
    print("tax is : $tax");
    update();
  }


// remove item list is use to delete the item from cart
//clear product list is used to clear all item from cart when the order successfully done
  removeItem(int index, int removeproduct) async {
    print("remover pressed");

    print(index);

    print(cartProduct);
    print(productIdList);

    await cartProduct.removeAt(index);
    await productIdList.removeAt(index);

    setproductSubtotal(index);
    setProductTotalprice();
    print(cartProduct);
    print(productIdList);
    update();
  }

  clearProductList() {
    cartProduct.clear();
    productIdList.clear();
    update();
  }

//-------------------------------------------------------------------------------------
// Create order is use for calling api for create order

  createOrder() async {
    print('order api calling');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String deviceType = sharedPreferences.get("deviceType");

 // map is used to convert all item to key and value pairs
 // for loop is use to add list of selected product to map which is passed in json
 //format in api
    Map mapdata = {};

    for (int i = 0; i < cartProduct.length; i++) {
      var data = {
      "order_total": productTotalPrice.toString(),
      "company_id": companyId.toString(),
      "delivery_address": "G14 Islamabad pakistan 40100",
      "device_type": deviceType,
      "fee": fee.toString(),
      "payment_method": paymentMethod,
      "status": 5.toString(),
        "products[$i][product_name]": cartProduct[i]["product_name"].toString(),
        "products[$i][product_id]": cartProduct[i]["product_id"].toString(),
        "products[$i][product_price]": cartProduct[i]["product_price"].toString(),
        "products[$i][discounted_price]":cartProduct[i]["discounted_price"].toString(),
        "products[$i][quantity]": cartProduct[i]["quantity"].toString(),
        "products[$i][description]": cartProduct[i]["description"].toString(),
      };
      mapdata.addAll(data);
      
    }


  //calling api and store response in model class
    createOrderModel = await createOrderApi.createOrderApi(mapdata
    );

    message = createOrderModel.result.message;
    rFlag = createOrderModel.result.rflag;

    update();
  }
}
