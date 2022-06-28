// To parse this JSON data, do
//
//     final userDashboardModel = userDashboardModelFromJson(jsonString);

import 'dart:convert';

UserDashboardModel userDashboardModelFromJson(String str) => UserDashboardModel.fromJson(json.decode(str));

String userDashboardModelToJson(UserDashboardModel data) => json.encode(data.toJson());

class UserDashboardModel {
    UserDashboardModel({
        this.restaurantList,
        this.result,
        this.popularProductsList,
        this.trendingList,
    });

    List<RestaurantList> restaurantList;
    Result result;
    List<PopularProductsList> popularProductsList;
    List<TrendingList> trendingList;

    factory UserDashboardModel.fromJson(Map<String, dynamic> json) => UserDashboardModel(
        restaurantList: List<RestaurantList>.from(json["RestaurantList"].map((x) => RestaurantList.fromJson(x))),
        result: Result.fromJson(json["result"]),
        popularProductsList: List<PopularProductsList>.from(json["PopularProductsList"].map((x) => PopularProductsList.fromJson(x))),
        trendingList: List<TrendingList>.from(json["TrendingList"].map((x) => TrendingList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "RestaurantList": List<dynamic>.from(restaurantList.map((x) => x.toJson())),
        "result": result.toJson(),
        "PopularProductsList": List<dynamic>.from(popularProductsList.map((x) => x.toJson())),
        "TrendingList": List<dynamic>.from(trendingList.map((x) => x.toJson())),
    };
}

class PopularProductsList {
    PopularProductsList({
        this.id,
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String shortDesc;
    String longDesc;
    int originalPrice;
    dynamic salePrice;
    String image;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory PopularProductsList.fromJson(Map<String, dynamic> json) => PopularProductsList(
        id: json["id"],
        name: json["name"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"] == null ? null : json["long_desc"],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        image: json["default_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_desc": shortDesc,
        "long_desc": longDesc == null ? null : longDesc,
        "original_price": originalPrice,
        "sale_price": salePrice,
        "default_image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class RestaurantList {
    RestaurantList({
        this.id,
        this.name,
        this.phoneNumber,
        this.email,
        this.fcmToken,
        this.apiToken,
        this.address,
        this.status,
        this.profileImg,
        this.document,
        this.timezone,
        this.latitude,
        this.longitude,
        this.miles,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String phoneNumber;
    String email;
    dynamic fcmToken;
    dynamic apiToken;
    String address;
    int status;
    String profileImg;
    String document;
    dynamic timezone;
    String latitude;
    String longitude;
    int miles;
    DateTime createdAt;
    DateTime updatedAt;

    factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        fcmToken: json["fcm_token"],
        apiToken: json["api_token"],
        address: json["address"] == null ? null : json["address"],
        status: json["status"],
        profileImg: json["profile_img"] == null ? null : json["profile_img"],
        document: json["document"] == null ? null : json["document"],
        timezone: json["timezone"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        miles: json["miles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email == null ? null : email,
        "fcm_token": fcmToken,
        "api_token": apiToken,
        "address": address == null ? null : address,
        "status": status,
        "profile_img": profileImg == null ? null : profileImg,
        "document": document == null ? null : document,
        "timezone": timezone,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "miles": miles,
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

class TrendingList {
    TrendingList({
        this.companyId,
        this.companyName,
        this.companyUrl,
        this.productUrl,
        this.totalOrders,
    });

    int companyId;
    String companyName;
    String companyUrl;
    String productUrl;
    int totalOrders;

    factory TrendingList.fromJson(Map<String, dynamic> json) => TrendingList(
        companyId: json["company_id"],
        companyName: json["company_name"],
        companyUrl: json["company_url"],
        productUrl: json["product_url"],
        totalOrders: json["total_orders"],
    );

    Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_name": companyName,
        "company_url": companyUrl,
        "product_url": productUrl,
        "total_orders": totalOrders,
    };
}
