import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannnBarcodeAddPage extends ConsumerWidget {
  final void Function(BarcodeCapture capture ) onDetect;
  const ScannnBarcodeAddPage(this.onDetect, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var ctr = ref.read(scannController);
    return Scaffold(
      body: MobileScanner(
        controller: ctr.cameraCtr,
        onDetect:onDetect,
      ),
    );
  }
}
















// import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
// import 'package:barcodbek/src/features/scanner/view/widgets/dialog.dart';
// import 'package:barcodbek/src/features/scanner/view/widgets/snakebar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class ScanCamera extends ConsumerWidget {
//   const ScanCamera({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     return
//   }
// }