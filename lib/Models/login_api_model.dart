// To parse this JSON data, do
//
//     final loginApiModel = loginApiModelFromJson(jsonString);

import 'dart:convert';

LoginApiModel loginApiModelFromJson(String str) => LoginApiModel.fromJson(json.decode(str));

String loginApiModelToJson(LoginApiModel data) => json.encode(data.toJson());

class LoginApiModel {
    LoginApiModel({
        this.result,
        this.token,
        this.user,
    });

    Result result;
    Token token;
    User user;

    factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
        result: Result.fromJson(json["result"]),
        token: Token.fromJson(json["token"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "token": token.toJson(),
        "user": user.toJson(),
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

class Token {
    Token({
        this.accessToken,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.expiresAt,
    });

    String accessToken;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime expiresAt;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["AccessToken"],
        userId: json["UserId"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        expiresAt: DateTime.parse(json["ExpiresAt"]),
    );

    Map<String, dynamic> toJson() => {
        "AccessToken": accessToken,
        "UserId": userId,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "ExpiresAt": expiresAt.toIso8601String(),
    };
}

class User {
    User({
        this.userId,
        this.name,
        this.email,
        this.phoneNo,
        this.timezone,
        this.fcmToken,
        this.profileImage,
        this.latitude,
        this.longitude,
        this.loginType,
        this.userType,
    });

    int userId;
    String name;
    String email;
    String phoneNo;
    String timezone;
    String fcmToken;
    String profileImage;
    double latitude;
    double longitude;
    String loginType;
    int userType;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["UserId"],
        name: json["Name"],
        email: json["Email"],
        phoneNo: json["PhoneNo"],
        timezone: json["Timezone"],
        fcmToken: json["FcmToken"],
        profileImage: json["ProfileImage"],
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        loginType: json["LoginType"],
        userType: json["UserType"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
        "Name": name,
        "Email": email,
        "PhoneNo": phoneNo,
        "Timezone": timezone,
        "FcmToken": fcmToken,
        "ProfileImage": profileImage,
        "Latitude": latitude,
        "Longitude": longitude,
        "LoginType": loginType,
        "UserType": userType,
    };
}
