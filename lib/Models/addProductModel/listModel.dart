import 'package:customer/Models/addProductModel/productModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listModel.g.dart';

@JsonSerializable()
class ListModel {
  List<ProductModel> data=[];
  ListModel({this.data});
  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}