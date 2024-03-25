import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final scannController = ChangeNotifierProvider.autoDispose(
  (ref) => ScanController(),
);

class ScanController extends ChangeNotifier {
  bool disposeScanner1 = true;
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerOther = TextEditingController();

  MobileScannerController cameraCtr = MobileScannerController(
    detectionTimeoutMs: 1000,
    useNewCameraSelector: false,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  void isCheck() {
    disposeScanner1 = !disposeScanner1;

    notifyListeners();
  }
}
