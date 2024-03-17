import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingController = ChangeNotifierProvider.autoDispose((ref) => SettingController());

class SettingController extends ChangeNotifier {
  int buttonindex = 1;
  void ontab(index) {
    buttonindex = index;
    notifyListeners();
  }
}
