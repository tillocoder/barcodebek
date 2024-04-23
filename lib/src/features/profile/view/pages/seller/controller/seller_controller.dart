import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellerController = ChangeNotifierProvider.autoDispose((ref) => SellerController());
int indexseller = 0;

class SellerController extends ChangeNotifier {
  SellerController() {
     sellerget();
  }

  void sellerget() async {
    await SellerGetServices.sellerGetData();
    notifyListeners();
  }

    final List<bool> _userActive = List.generate(SellerGetServices.seller.length, (index) => SellerGetServices.seller[index].is_active);

  List<bool> get userActive => _userActive;

  void isactive(int index, bool value) {
    _userActive[index] = value;
    notifyListeners();
  }
}
