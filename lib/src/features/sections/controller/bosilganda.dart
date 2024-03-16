import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deptorsController = ChangeNotifierProvider((ref) => DeptorsController());

class DeptorsController extends ChangeNotifier {
  List<bool> isChecked = [];
  int index = 0;

  void onChang() {
    isChecked[index] = !isChecked[index];
    notifyListeners();
  }
}
