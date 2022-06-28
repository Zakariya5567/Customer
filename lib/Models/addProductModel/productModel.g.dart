// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    productName: json['productName'] as String,
    productId: json['productId'] as String,
    productPrice: json['productPrice'] as String,
    discountedPrice: json['discountedPrice'] as String,
    quantity: json['quantity'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productId': instance.productId,
      'productPrice': instance.productPrice,
      'discountedPrice': instance.discountedPrice,
      'quantity': instance.quantity,
      'description': instance.description,
    };
