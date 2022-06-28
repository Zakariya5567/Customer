// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
    OrderHistoryModel({
        this.orders,
        this.todaysOrder,
        this.result,
    });

    List<Order> orders;
    List<Order> todaysOrder;
    Result result;

    factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        todaysOrder: List<Order>.from(json["todays_order"].map((x) => Order.fromJson(x))),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "todays_order": List<dynamic>.from(todaysOrder.map((x) => x.toJson())),
        "result": result.toJson(),
    };
}

class Order {
    Order({
        this.id,
        this.orderDate,
        this.time,
        this.status,
        this.orderTotal,
        this.orderSubtotal,
        this.fee,
        this.paymentMethod,
        this.createdAt,
        this.updatedAt,
        this.companyId,
        this.deviceType,
        this.discount,
        this.customerId,
        this.tax,
        this.promoCode,
        this.fromAddress,
        this.deliveryAddress,
        this.name,
        this.companyName,
        this.products,
    });

    int id;
    dynamic orderDate;
    String time;
    int status;
    String orderTotal;
    int orderSubtotal;
    String fee;
    String paymentMethod;
    DateTime createdAt;
    DateTime updatedAt;
    int companyId;
    String deviceType;
    String discount;
    int customerId;
    String tax;
    dynamic promoCode;
    dynamic fromAddress;
    String deliveryAddress;
    String name;
    String companyName;
    List<Product> products;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: json["order_date"],
        time: json["time"],
        status: json["status"],
        orderTotal: json["order_total"],
        orderSubtotal: json[ "order_sub_total"],
        fee: json["fee"],
        paymentMethod: json["payment_method"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyId: json["company_id"],
        deviceType: json["device_type"],
        discount: json["discount"],
        customerId: json["customer_id"],
        tax: json["tax"],
        promoCode: json["promo_code"],
        fromAddress: json["from_address"],
        deliveryAddress: json["delivery_address"],
        name: json["name"] == null ? null : json["name"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x)))==null?null:
                  List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": orderDate,
        "time": time,
        "status": status,
        "order_total": orderTotal,
        "order_sub_total": orderSubtotal,
        "fee": fee,
        "payment_method": paymentMethod,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_id": companyId,
        "device_type": deviceType,
        "discount": discount,
        "customer_id": customerId,
        "tax": tax,
        "promo_code": promoCode,
        "from_address": fromAddress,
        "delivery_address": deliveryAddress,
        "name": name == null ? null : name,
        "company_name": companyName == null ? null : companyName,
        "products": List<dynamic>.from(products.map((x) => x.toJson()))==null?null:
                    List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.orderId,
        this.productId,
        this.description,
        this.productPrice,
        this.discountedPrice,
        this.quantity,
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.defaultImage,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int orderId;
    int productId;
    dynamic description;
    int productPrice;
    String discountedPrice;
    int quantity;
    String name;
    String shortDesc;
    dynamic longDesc;
    int originalPrice;
    dynamic salePrice;
    dynamic defaultImage;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        description: json["description"],
        productPrice: json["product_price"],
        discountedPrice: json["discounted_price"],
        quantity: json["quantity"],
        name: json["name"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        defaultImage: json["default_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "description": description,
        "product_price": productPrice,
        "discounted_price": discountedPrice,
        "quantity": quantity,
        "name": name,
        "short_desc": shortDesc,
        "long_desc": longDesc,
        "original_price": originalPrice,
        "sale_price": salePrice,
        "default_image": defaultImage,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Result {
    Result({
        this.code,
        this.message,
        this.description,
        this.rflag,
    });

    int code;
    String message;
    String description;
    int rflag;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["Code"],
        message: json["Message"],
        description: json["Description"],
        rflag: json["Rflag"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "Description": description,
        "Rflag": rflag,
    };
}
