import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// ignore: must_be_immutable
class TovarQoshish extends ConsumerWidget {
  const TovarQoshish({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var con = ref.read(scannController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotni qo\'shish'),
        actions: [
          IconButton(
            onPressed: () {
              con.cameradispone();
            },
            icon: const Icon(Icons.barcode_reader),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: con.disposeScanner ? buildMobileScanner(context, ref) : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileScanner(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var con = ref.read(scannController);
    return MobileScanner(
      overlay: Positioned(
        top: 100,
        child: SvgPicture.asset(
          'assets/kere.svg',
          height: 100,
          width: 400,
        ),
      ),
      controller: MobileScannerController(
        useNewCameraSelector: true,
        torchEnabled: true,
        detectionSpeed: DetectionSpeed.values.first,
      ),
      onDetect: (capture) {
        List<String> barcodlar = [];
        for (var e in con.scannModelPrice) {
          barcodlar.add(e.barcode);
        }
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          final barcodeValue = barcode.rawValue.toString();
          if (!barcodlar.contains(barcodeValue)) {
            con.cameradispone();
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Nomi',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabled: true,
                        ),
                        controller: con.controllerName,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Narxi',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabled: true,
                        ),
                        controller: con.controllerPrice,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Qo\'shimcha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabled: true,
                        ),
                        controller: con.controllerOther,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              con.cameradispone();
                              ScannModelPrice model = ScannModelPrice(
                                barcode: barcodeValue,
                                price: con.controllerPrice.text,
                                name: con.controllerName.text,
                                dateTime: DateTime.now().toIso8601String().substring(0, 10),
                              );
                              con.scannModelPrice.add(model);
                              con.controllerName.clear();
                              con.controllerPrice.clear();
                              con.controllerOther.clear();
                              Navigator.pop(context);
                            },
                            child: const Text('Qo\'shish'),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              con.controllerName.clear();
                              con.controllerPrice.clear();
                              con.controllerOther.clear();
                              Navigator.pop(context);
                            },
                            child: const Text('Bekor qilish'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Barcode already scanned'),
              ),
            );
          }
        }
      },
    );
  }
}

class ScannModelPrice {
  final String barcode;
  final String price;
  final String name;
  final String dateTime;

  ScannModelPrice({required this.barcode, required this.price, required this.name, required this.dateTime});
}
