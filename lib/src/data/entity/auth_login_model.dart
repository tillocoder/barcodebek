import 'dart:convert';

List<AuthLoginModel> authLoginModelFromJson(String str) => List<AuthLoginModel>.from(json.decode(str).map((x) => AuthLoginModel.fromJson(x)));

String authLoginModelToJson(List<AuthLoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthLoginModel {
  final String phoneNumber;
  final String password;

  AuthLoginModel({
    required this.phoneNumber,
    required this.password,
  });

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) => AuthLoginModel(
    phoneNumber: json["phone_number"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "password": password,
  };
}
