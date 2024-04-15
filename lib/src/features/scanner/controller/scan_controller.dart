import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final scannController = ChangeNotifierProvider.autoDispose(
  (ref) => ScanController(),
);

class ScanController extends ChangeNotifier {
  List<String> barcodlar = [];

  ScanController() {
    boxAddFor();
  }

  void boxAddFor() {
    for (var e in listtt) {
      barcodlar.add(e.barCode.toString());
    }
    notifyListeners();
  }

  bool disposeScanner1 = true;

  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerOther = TextEditingController();

  MobileScannerController cameraCtr = MobileScannerController(
    detectionTimeoutMs: 5000,
    useNewCameraSelector: false,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  void isCheck() {
    disposeScanner1 = !disposeScanner1;

    notifyListeners();
  }
}
