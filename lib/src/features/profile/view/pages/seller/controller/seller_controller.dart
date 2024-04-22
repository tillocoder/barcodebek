import 'package:barcodbek/src/core/services/sellerget/seller_get.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellerController = ChangeNotifierProvider.autoDispose((ref) => SellerController());

class SellerController extends ChangeNotifier {
  SellerController() {
    sellerget();
  }

  void sellerget() async {
    await SellerGetServices.sellerGetData();
    notifyListeners();
  }
}
