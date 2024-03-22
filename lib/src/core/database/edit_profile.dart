import 'package:barcodbek/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final db = ChangeNotifierProvider.autoDispose((ref) => DBEditProfil());

class DBEditProfil extends ChangeNotifier {
  String loat() {
    return prefs.getString("Edit") ?? '0';
    notifyListeners();
  }

  Future<void> save(String edit) async {
    await prefs.setString("Edit", edit);
    notifyListeners();
  }
}
