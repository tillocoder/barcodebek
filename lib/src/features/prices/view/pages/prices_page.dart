import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PricesPages extends ConsumerWidget {
  const PricesPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemCount: scannModelPrice.length,
        itemBuilder: (context, index) {
          var item = scannModelPrice[index];
          return ListTile(
            title: Text(item.barcode),
          );
        },
      ),
    );
  }
}
