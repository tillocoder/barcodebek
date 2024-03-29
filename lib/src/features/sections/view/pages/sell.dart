import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/camera.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/flash.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/snakebar.dart';
import 'package:barcodbek/src/features/sections/controller/sell_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:svg_flutter/svg.dart';

import '../../../scanner/controller/scan_controller.dart';

class SellPages extends ConsumerWidget {
  const SellPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sellController);
    var ctr = ref.read(sellController);
    var scanCtr = ref.read(scannController);

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ScannnBarcodeAddPage(
                (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  var barcodeValue;
                  for (final barcode in barcodes) {
                    barcodeValue = barcode.rawValue.toString();
                  }
                  for (var i = 0; i < box.values.toList().length; ++i) {
                    if (scanCtr.barcodlar.contains(barcodeValue)) {
                      ctr.savatAdd(box.values.toList()[i]);
                      ctr.count.add(1);
                    }
                    if (!(scanCtr.barcodlar.contains(barcodeValue))) {
                      snakebar(context, "Bu tovar xoyirqdq yoq");
                    }
                    if (scanCtr.barcodlar.contains(barcodeValue)) {
                      snakebar(context, "Bu Tavar bor");
                    }
                  }
                },
              ),
            ),
          ),
          const Positioned(
            top: 20,
            right: 20,
            child: Flash(),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.xmark,
                color: AppColorss.c_FFFFFF,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Lottie.asset('assets/lottie/cursor.json'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: SvgPicture.asset(
                'assets/icons/home/burchak.svg',
                height: 133,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                    color: AppColorss.c_FFFFFF,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: ctr.savat.length,
                    itemBuilder: (contex, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: Text(ctr.savat.toList()[index].barcode),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ctr.savat.toList()[index].name),
                                Text(ctr.savat.toList()[index].price),
                              ],
                            ),
                            trailing: Card(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ctr.oshuvchi(index);
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColorss.c_9745FF,
                                    ),
                                  ),
                                  Text(ctr.count.elementAt(index).toString()),
                                  IconButton(
                                    onPressed: () {
                                      ctr.kamayuvchi(index);
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: AppColorss.c_9745FF,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
