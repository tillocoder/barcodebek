import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Flash extends ConsumerWidget {
  const Flash({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
   var ctr = ref.watch(scannController);
    return IconButton(
      color: Colors.white,
      icon: ValueListenableBuilder(
        valueListenable: ctr.cameraCtr.torchState,
        builder: (context, state, child) {
          switch (state) {
            case TorchState.off:
              return const Icon(Icons.flash_off, color: Colors.grey);
            case TorchState.on:
              return const Icon(Icons.flash_on, color: Colors.yellow);
          }
        },
      ),
      iconSize: 32.0,
      onPressed: () => ctr.cameraCtr.toggleTorch(),
    );
  }
}
