import 'package:hive_flutter/adapters.dart';
part 'qarzdor_user.g.dart';

@HiveType(typeId: 1)
class UserDeptors {
  @HiveField(0)
  String ismFamilya;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String qoshimcha;
  @HiveField(3)
  String berishmuddati;

  UserDeptors({
    required this.ismFamilya,
    required this.phoneNumber,
    required this.qoshimcha,
    required this.berishmuddati,
  });
}
