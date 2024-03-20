import 'package:barcodbek/main.dart';
import 'package:flutter/cupertino.dart';

class AppPassword {
  static final TextEditingController textPin = TextEditingController();
  static final pin = prefs.getString("pin");

  static Future<void> save(String controller) async {
    await prefs.setString('pin', controller);
  }
}
