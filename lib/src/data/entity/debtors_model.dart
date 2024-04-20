import 'dart:convert';

class Debtors {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String comment;
  final String amount;
  final List<Product> products;
  final String createdAt;

  Debtors({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.comment,
    required this.amount,
    required this.products,
    required this.createdAt,
  });

  factory Debtors.fromRawJson(String str) => Debtors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Debtors.fromJson(Map<String, dynamic> json) => Debtors(
    id: json["id"],
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
    comment: json["comment"],
    amount: json["amount"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "comment": comment,
    "amount": amount,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "created_at": createdAt,
  };
}

class Product {
  final String name;
  final String price;
  final String comment;
  final int barCode;
  final String createdAt;

  Product({
    required this.name,
    required this.price,
    required this.comment,
    required this.barCode,
    required this.createdAt,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    price: json["price"],
    comment: json["comment"],
    barCode: json["bar_code"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "comment": comment,
    "bar_code": barCode,
    "created_at": createdAt,
  };
}
