import 'package:barcodbek/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final db = ChangeNotifierProvider.autoDispose((ref) => DBEditProfil());

class DBEditProfil extends ChangeNotifier {
  String loat() {
    notifyListeners();
    return prefs.getString("Edit") ?? '0';
  }

  Future<void> save(String edit) async {
    await prefs.setString("Edit", edit);
    notifyListeners();
  }
}
