

import 'dart:convert';

UserPostTrade userPostTradeFromJson(String str) => UserPostTrade.fromJson(json.decode(str));

String userPostTradeToJson(UserPostTrade data) => json.encode(data.toJson());

class UserPostTrade {
    final List<Product> product;

    UserPostTrade({
        required this.product,
    });

    factory UserPostTrade.fromJson(Map<String, dynamic> json) => UserPostTrade(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    final int barCode;
    final int number;

    Product({
        required this.barCode,
        required this.number,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        barCode: json["bar_code"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "bar_code": barCode,
        "number": number,
    };
}
