import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editController = ChangeNotifierProvider((ref) => EditControler());

class EditControler extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();
  bool isOnTap = false;

  void onTap() {
    isOnTap = !isOnTap;
    notifyListeners();
  }

  String? name;

  void nameOnTap(String name1) {
    name = name1;
    notifyListeners();
  }
}