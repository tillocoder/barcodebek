import 'package:barcodbek/main.dart';
import 'package:flutter/material.dart';

class DBLanguage extends ChangeNotifier {
  String? applanguage;
  DBLanguage() {
    loadtodo();
  }

  Future<String> loadtodo() async {
    //? savat olindi
    notifyListeners();

   return prefs.getString('applang') ?? 'uz';
  }

  

  Future<void> save(String languagecode) async {
    //? savatga malumotlar saqlandi
    prefs.setString('applang', languagecode);
    notifyListeners();
  }
}
