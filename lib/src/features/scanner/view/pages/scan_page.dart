import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/camera.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/dialog.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/flash.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/snakebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannPage extends ConsumerWidget {
  const ScannPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var ctr = ref.read(scannController);

    return Scaffold(
      body: ctr.disposeScanner1
          ? Stack(
              children: [
                Expanded(
                  child: ScannnBarcodeAddPage(
                    (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        final barcodeValue = barcode.rawValue.toString();
                        if (!ctr.barcodlar.contains(barcodeValue)) {
                          ctr.isCheck();
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: WDialog(barcodeValue: barcodeValue),
                              ),
                            ),
                          );
                          return;
                        } else {
                          snakebar(
                            context,
                            'Bu Tavar Mavjud',
                          );
                        }
                      }
                    },
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(
                    child: Positioned(
                      top: 20,
                      right: 20,
                      child: Flash(),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: Lottie.asset('assets/lottie/cursor.json'),
                  ),
                ),
                Align(
                  child: SvgPicture.asset(
                    'assets/icons/home/burchak.svg',
                    height: 135,
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
