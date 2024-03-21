import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TovarQoshish extends StatefulWidget {
  const TovarQoshish({Key? key}) : super(key: key);

  @override
  State<TovarQoshish> createState() => _TovarQoshishState();
}

List<ScannModelPrice> scannModelPrice = [];

class _TovarQoshishState extends State<TovarQoshish> {
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerOther = TextEditingController();
  MobileScannerController scannerControlerMobile = MobileScannerController();

  int index = 0;
  Set<String> scannedBarcodes = {};
  bool torch = false;
  bool disposeScanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotni qo\'shish'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                disposeScanner = !disposeScanner;
              });
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
              child: disposeScanner
                  ? buildMobileScanner(context)
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileScanner(BuildContext context) {
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
        detectionSpeed: DetectionSpeed.values.first,
      ),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          final barcodeValue = barcode.rawValue.toString();
          if (!scannedBarcodes.contains(barcodeValue)) {
            scannedBarcodes.add(barcodeValue);
            setState(() {
              disposeScanner = false;
            });
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
                        controller: controllerName,
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
                        controller: controllerPrice,
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
                        controller: controllerOther,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                disposeScanner = true;
                                ScannModelPrice model = ScannModelPrice(
                                  barcode: barcodeValue,
                                  price: controllerPrice.text,
                                  name: controllerName.text,
                                  dateTime: DateTime.now()
                                      .toIso8601String()
                                      .substring(0, 10),
                                );
                                scannModelPrice.add(model);
                                controllerName.clear();
                                controllerPrice.clear();
                                controllerOther.clear();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text('Qo\'shish'),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              controllerName.clear();
                              controllerPrice.clear();
                              controllerOther.clear();
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

  ScannModelPrice(
      {required this.barcode,
      required this.price,
      required this.name,
      required this.dateTime});
}
