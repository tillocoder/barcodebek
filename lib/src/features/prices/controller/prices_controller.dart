import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductsModel> listtt = [];
final pricesController = ChangeNotifierProvider.autoDispose((ref) => PricesControler());

class PricesControler extends ChangeNotifier {
  get products => null;

  void addProduct(ProductsModel model) {
    boxProduct.add(model);
    notifyListeners();
  }

  void addCacheProduct(ProductsModel model) {
    listtt.add(model);
    boxProductCache.add(model);
    notifyListeners();
  }

  void removIndex(int index) {
    boxProduct.deleteAt(index);
    notifyListeners();
  }

  void removCahcheIndex(int index)async {
  await  boxProductCache.delete(index);
    listtt.removeAt(index);
    notifyListeners();
  }
}
