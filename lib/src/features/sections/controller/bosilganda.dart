import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/services/debtors/delet_services.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deptorsController = ChangeNotifierProvider((ref) => DeptorsController());

class DeptorsController extends ChangeNotifier {
  DeptorsController() {
    getDebtors();
  }

  List<bool> isChecked = [];

  void onChang(index) {
    isChecked[index] = !isChecked[index];
    notifyListeners();
  }

  bool bosliganda = false;

  void onTap(bool value) async {
    bosliganda = value;
    notifyListeners();
  }


  //
  void getDebtors() async {
    await GetDebtorsServices.GET();
    notifyListeners();
  }
}
