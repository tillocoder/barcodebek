import 'dart:convert';

class DebtorUser {
  final String fullName;
  final String phoneNumber;
  final String comment;
  final List<Product> products;

  DebtorUser({
    required this.fullName,
    required this.phoneNumber,
    required this.comment,
    required this.products,
  });

  factory DebtorUser.fromRawJson(String str) => DebtorUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DebtorUser.fromJson(Map<String, dynamic> json) => DebtorUser(
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
    comment: json["comment"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "phone_number": phoneNumber,
    "comment": comment,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  final double barCode;
  final int number;

  Product({
    required this.barCode,
    required this.number,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    barCode: json["bar_code"]?.toDouble(),
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "bar_code": barCode,
    "number": number,
  };
}
