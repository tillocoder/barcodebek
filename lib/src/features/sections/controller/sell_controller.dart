import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellController = ChangeNotifierProvider((ref) => SellController());

class SellController extends ChangeNotifier {
  Set<ScannModelPrice> savat = {};

  void savatAdd(ScannModelPrice data) {
    savat.add(data);
    notifyListeners();
  }

  List<int> count = [];

  void oshuvchi(int index) {
    count[index]++;
    notifyListeners();
  }

  void kamayuvchi(int index) {
    count[index]--;
    notifyListeners();
  }
}
