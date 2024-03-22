import 'package:barcodbek/src/features/scanner/view/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final scannController = ChangeNotifierProvider.autoDispose((ref) => ScanController());
  List<ScannModelPrice> scannModelPrice = [];

class ScanController extends ChangeNotifier {
  bool disposeScanner = true;
  bool torch = false;

  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerOther = TextEditingController();
  MobileScannerController cameraCtr = MobileScannerController(
      useNewCameraSelector: true,
      detectionSpeed: DetectionSpeed.values.first,
    );


  void deleteProduct(index) {
    scannModelPrice.removeAt(index);
    notifyListeners();
  }
  void addProduct(ScannModelPrice model) {
    scannModelPrice.add(model);
    notifyListeners();
  }
}
