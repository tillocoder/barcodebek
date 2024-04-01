import 'package:barcodbek/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deptorsController = ChangeNotifierProvider((ref) => DeptorsController());

class DeptorsController extends ChangeNotifier {
  List<bool> isChecked = [];

  void onChang(int index) {
    isChecked[index] = !isChecked[index];
    notifyListeners();
  }

  bool bosliganda = false;

  void onTap(bool value) {
    bosliganda = value;
    notifyListeners();
  }

  void delete(int index) {
    boxdeptors.delete(index);
    notifyListeners();
  }
}
