import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WDialog extends ConsumerWidget {
  const WDialog({
    super.key,
    required this.barcodeValue,
  });

  final String barcodeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var ctr= ref.read(scannController);
    return Column(
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
          controller: ctr.controllerName,
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
          controller: ctr.controllerPrice,
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
          controller: ctr.controllerOther,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                ScannModelPrice model = ScannModelPrice(
                  barcode: barcodeValue,
                  price: ctr.controllerPrice.text,
                  name: ctr.controllerName.text,
                  dateTime: DateTime.now().toIso8601String().substring(0, 10),
                );
                ctr.addProduct(model);
                ctr.controllerName.clear();
                ctr.controllerPrice.clear();
                ctr.controllerOther.clear();
                Navigator.pop(context);
              },
              child: const Text('Qo\'shish'),
            ),
            OutlinedButton(
              onPressed: () {
                ctr.controllerName.clear();
                ctr.controllerPrice.clear();
                ctr.controllerOther.clear();
                Navigator.pop(context);
              },
              child: const Text('Bekor qilish'),
            )
          ],
        )
      ],
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
