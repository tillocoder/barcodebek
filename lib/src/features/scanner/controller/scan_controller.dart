import 'package:barcodbek/src/features/sections/view/pages/sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final scannController = ChangeNotifierProvider.autoDispose((ref) => ScanController());

class ScanController extends ChangeNotifier {
  ScanController() : super();
  bool disposeScanner = false;
  bool torch = false;
  List<ScannModelPrice> scannModelPrice = [];

  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerOther = TextEditingController();
  MobileScannerController scannerControlerMobile = MobileScannerController();

  cameradispone() {
    disposeScanner = !disposeScanner;
    notifyListeners();
  }

  void deleteProduct(index) {
    scannModelPrice.removeAt(index);
    notifyListeners();
  }
}
