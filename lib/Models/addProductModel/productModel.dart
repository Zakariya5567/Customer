import 'package:json_annotation/json_annotation.dart';

part 'productModel.g.dart';

@JsonSerializable()
class ProductModel {

   String productName;
    String productId;
    String productPrice;
    String discountedPrice;
    String quantity;
    String description;

   ProductModel({
        this.productName,
        this.productId,
        this.productPrice,
        this.discountedPrice,
        this.quantity,
        this.description,
});

   
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}