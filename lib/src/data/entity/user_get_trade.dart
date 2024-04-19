import 'dart:convert';

List<UserGetTrade> userGetTradeFromJson(String str) => List<UserGetTrade>.from(json.decode(str).map((x) => UserGetTrade.fromJson(x)));

String userGetTradeToJson(List<UserGetTrade> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserGetTrade {
  final int id;
  final User user;
  final String createdAt;
  final String totalAmount;
  final List<ProductElement> products;

  UserGetTrade({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.totalAmount,
    required this.products,
  });

  factory UserGetTrade.fromJson(Map<String, dynamic> json) => UserGetTrade(
        id: json["id"],
        user: User.fromJson(json["user"]),
        createdAt: json["created_at"],
        totalAmount: json["total_amount"],
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "created_at": createdAt,
        "total_amount": totalAmount,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  final ProductProduct product;
  final int number;

  ProductElement({
    required this.product,
    required this.number,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "number": number,
      };
}

class ProductProduct {
  final String name;
  final String price;
  final String comment;
  final int barCode;
  final String createdAt;

  ProductProduct({
    required this.name,
    required this.price,
    required this.comment,
    required this.barCode,
    required this.createdAt,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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

class User {
  final String phoneNumber;
  final String firstName;

  User({
    required this.phoneNumber,
    required this.firstName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phone_number"],
        firstName: json["first_name"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "first_name": firstName,
      };
}
