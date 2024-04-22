import 'dart:convert';

class UserVendorModel {
  final String phoneNumber;
  final bool confirm;

  UserVendorModel({
    required this.phoneNumber,
    required this.confirm,
  });

  factory UserVendorModel.fromRawJson(String str) =>
      UserVendorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserVendorModel.fromJson(Map<String, dynamic> json) =>
      UserVendorModel(
        phoneNumber: json["phone_number"],
        confirm: json["confirm"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "confirm": confirm,
      };

  @override
  String toString() {
    return "phoneNumber: $phoneNumber | confirm: $confirm ";
  }
}
