// To parse this JSON data, do
//
//     final createOrderModel = createOrderModelFromJson(jsonString);

import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) => CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) => json.encode(data.toJson());

class CreateOrderModel {
    CreateOrderModel({
        this.data,
        this.result,
    });

    Data data;
    Result result;

    factory CreateOrderModel.fromJson(Map<String, dynamic> json) => CreateOrderModel(
        data: Data.fromJson(json["data"]),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "result": result.toJson(),
    };
}

class Data {
    Data({
        this.orderTotal,
        this.companyId,
        this.deliveryAddress,
        this.deviceType,
        this.fee,
        this.paymentMethod,
        this.status,
        this.time,
        this.customerId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    String orderTotal;
    String companyId;
    String deliveryAddress;
    String deviceType;
    String fee;
    String paymentMethod;
    String status;
    String time;
    int customerId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderTotal: json["order_total"],
        companyId: json["company_id"],
        deliveryAddress: json["delivery_address"],
        deviceType: json["device_type"],
        fee: json["fee"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        time: json["time"],
        customerId: json["customer_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "order_total": orderTotal,
        "company_id": companyId,
        "delivery_address": deliveryAddress,
        "device_type": deviceType,
        "fee": fee,
        "payment_method": paymentMethod,
        "status": status,
        "time": time,
        "customer_id": customerId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
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
