// To parse this JSON data, do
//
//     final restaurantDetailModel = restaurantDetailModelFromJson(jsonString);

import 'dart:convert';

RestaurantDetailModel restaurantDetailModelFromJson(String str) => RestaurantDetailModel.fromJson(json.decode(str));

String restaurantDetailModelToJson(RestaurantDetailModel data) => json.encode(data.toJson());

class RestaurantDetailModel {
    RestaurantDetailModel({
        this.restaurant,
        this.categoriesList,
        this.productsList,
        this.result,
    });

    Restaurant restaurant;
    List<CategoriesList> categoriesList;
    List<ProductsList> productsList;
    Result result;

    factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) => RestaurantDetailModel(
        restaurant: Restaurant.fromJson(json["Restaurant"]),
        categoriesList: List<CategoriesList>.from(json["CategoriesList"].map((x) => CategoriesList.fromJson(x))),
        productsList: List<ProductsList>.from(json["ProductsList"].map((x) => ProductsList.fromJson(x))),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "Restaurant": restaurant.toJson(),
        "CategoriesList": List<dynamic>.from(categoriesList.map((x) => x.toJson())),
        "ProductsList": List<dynamic>.from(productsList.map((x) => x.toJson())),
        "result": result.toJson(),
    };
}

class CategoriesList {
    CategoriesList({
        this.id,
        this.name,
        this.status,
        this.coverPhoto,
        this.categoryImage,
        this.updatedAt,
        this.createdAt,
        this.serviceId,
        this.productId,
        this.companyId,
    });

    int id;
    String name;
    int status;
    String coverPhoto;
    String categoryImage;
    DateTime updatedAt;
    DateTime createdAt;
    int serviceId;
    int productId;
    int companyId;

    factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        coverPhoto: json["cover_photo"],
        categoryImage: json["category_image"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        serviceId: json["service_id"],
        productId: json["product_id"],
        companyId: json["company_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "cover_photo": coverPhoto,
        "category_image": categoryImage,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "service_id": serviceId,
        "product_id": productId,
        "company_id": companyId,
    };
}

class ProductsList {
    ProductsList({
        this.id,
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.defaultImage,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.serviceId,
        this.productId,
        this.companyId,
        this.imagePath,
    });

    int id;
    String name;
    String shortDesc;
    String longDesc;
    int originalPrice;
    int salePrice;
    String defaultImage;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    int serviceId;
    int productId;
    int companyId;
    String imagePath;

    factory ProductsList.fromJson(Map<String, dynamic> json) => ProductsList(
        id: json["id"],
        name: json["name"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"] == null ? null : json["long_desc"],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        defaultImage: json["default_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceId: json["service_id"],
        productId: json["product_id"],
        companyId: json["company_id"],
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_desc": shortDesc,
        "long_desc": longDesc == null ? null : longDesc,
        "original_price": originalPrice,
        "sale_price": salePrice,
        "default_image": defaultImage,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_id": serviceId,
        "product_id": productId,
        "company_id": companyId,
        "image_path": imagePath,
    };
}

class Restaurant {
    Restaurant({
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
        this.fee,
        this.tax,
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
    dynamic document;
    int fee;
    int tax;
    dynamic timezone;
    String latitude;
    String longitude;
    int miles;
    DateTime createdAt;
    DateTime updatedAt;

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        fcmToken: json["fcm_token"],
        apiToken: json["api_token"],
        address: json["address"],
        status: json["status"],
        profileImg: json["profile_img"],
        document: json["document"],
        fee: json["fee"],
        tax: json["tax"],
        timezone: json["timezone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        miles: json["miles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "fcm_token": fcmToken,
        "api_token": apiToken,
        "address": address,
        "status": status,
        "profile_img": profileImg,
        "document": document,
        "fee": fee,
        "tax": tax,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
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
