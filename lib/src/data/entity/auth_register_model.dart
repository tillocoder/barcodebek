import 'dart:convert';

class AuthRegisterModel {
  final String firstName;
  final String phoneNumber;
  final String password;
  final String type;
  final String market;
  final String stir;

  AuthRegisterModel({
    required this.firstName,
    required this.phoneNumber,
    required this.password,
    required this.type,
    required this.market,
    required this.stir,
  });

  factory AuthRegisterModel.fromRawJson(String str) => AuthRegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthRegisterModel.fromJson(Map<String, dynamic> json) => AuthRegisterModel(
    firstName: json["first_name"],
    phoneNumber: json["phone_number"],
    password: json["password"],
    type: json["type"],
    market: json["market"],
    stir: json["stir"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "phone_number": phoneNumber,
    "password": password,
    "type": type,
    "market": market,
    "stir": stir,
  };

  @override
  String toString() {
    return 'AuthRegisterModel(firstName: $firstName, phoneNumber: $phoneNumber, password: $password, type: $type, market: $market, stir: $stir)';
  }
}
