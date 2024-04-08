import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductsModel> scannModelPrice = [];
final pricesController =
    ChangeNotifierProvider.autoDispose((ref) => PricesControler());

class PricesControler extends ChangeNotifier {
  void addProduct(ProductsModel model) {
    box.add(model);
    notifyListeners();
  }

  void removIndex(int index) {
    box.deleteAt(index);
    notifyListeners();
  }
}
