
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';


part 'user_get_model.g.dart';



List<UserGetData> userGetDataFromJson(String str) =>
    List<UserGetData>.from(
        json.decode(str).map((x) => UserGetData.fromJson(x)));

String userGetDataToJson(List<UserGetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 2)
class UserGetData {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final String market;

  UserGetData({
    required this.id,
    required this.firstName,
    required this.phoneNumber,
    required this.type,
    required this.market,
  });

  factory UserGetData.fromJson(Map<String, dynamic> json) =>
      UserGetData(
        id: json["id"],
        firstName: json["first_name"],
        phoneNumber: json["phone_number"],
        type: json["type"],
        market: json["market"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "first_name": firstName,
        "phone_number": phoneNumber,
        "type": type,
        "market": market,
      };

  @override
  String toString() {
    return 'UserGetData{id: $id, first_name: $firstName, phone_number: $phoneNumber, type: $type, market: $market}';
  }
}