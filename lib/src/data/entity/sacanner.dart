import 'package:hive_flutter/adapters.dart';

part 'sacanner.g.dart';

@HiveType(typeId: 0)
class ScannModelPrice {
  @HiveField(0)
  final String barcode;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String dateTime;

  @HiveField(4)
  ScannModelPrice({
    required this.barcode,
    required this.price,
    required this.name,
    required this.dateTime,
  });
}
