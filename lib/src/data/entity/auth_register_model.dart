
import 'dart:convert';

AuthRegisterModel authRegisterModelFromJson(String str) => AuthRegisterModel.fromJson(json.decode(str));

String authRegisterModelToJson(AuthRegisterModel data) => json.encode(data.toJson());

class AuthRegisterModel {
  final String phoneNumber;
  final String password;
  final String type;
  final String market;
  final String stir;
  final String firstName;

  AuthRegisterModel({
    required this.phoneNumber,
    required this.password,
    required this.type,
    required this.market,
    required this.stir,
    required this.firstName,
  });

  factory AuthRegisterModel.fromJson(Map<String, dynamic> json) => AuthRegisterModel(
    phoneNumber: json["phone_number"],
    password: json["password"],
    type: json["type"],
    market: json["market"],
    stir: json["stir"],
    firstName: json["first_name"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "password": password,
    "type": type,
    "market": market,
    "stir": stir,
    "first_name": firstName,
  };
  @override
  String toString() {
    return 'AuthRegisterModel{phoneNumber: $phoneNumber, password: $password, type: $type, market: $market, stir: $stir, firstName: $firstName}';
  }

}
