import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authConttroler =
    ChangeNotifierProvider.autoDispose((ref) => AuthConttroler());

class AuthConttroler extends ChangeNotifier {
  bool? isChecked;
  void onTap(bool value) {
    isChecked = value;
    notifyListeners();
  }
}
