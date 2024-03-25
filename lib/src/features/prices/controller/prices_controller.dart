import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ScannModelPrice> scannModelPrice = [];
final pricesController =
    ChangeNotifierProvider.autoDispose((ref) => PricesControler());

class PricesControler extends ChangeNotifier {
  void addProduct(ScannModelPrice model) {
    box.add(model);
    notifyListeners();
  }

  void removIndex(int index) {
    box.deleteAt(index);
    notifyListeners();
  }
}
