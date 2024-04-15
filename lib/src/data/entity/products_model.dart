import 'dart:convert';
import 'package:hive_flutter/adapters.dart';

part "products_model.g.dart";

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class ProductsModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String comment;
  @HiveField(3)
  final int barCode;
  @HiveField(4)
  final String createdAt;

  ProductsModel({
    required this.name,
    required this.price,
    required this.comment,
    required this.barCode,
    required this.createdAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        name: json["name"],
        price: json["price"],
        comment: json["comment"],
        barCode: json["bar_code"],
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "comment": comment,
        "bar_code": barCode,
        "created_at": createdAt,
      };
      @override
String toString() {
  return 'ProductsModel(name: $name, price: $price, comment: $comment, barCode: $barCode, createdAt: $createdAt)';
}

}
