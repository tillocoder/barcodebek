import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/auth/controller/auth_conttroler.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/camera.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/flash.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/view/widgets/w_bottomnav.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/view/widgets/widget_product_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:svg_flutter/svg.dart';

class SellPages extends ConsumerWidget {
  const SellPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sellController);
    var ctr = ref.read(sellController);
    var scanCtr = ref.read(scannController);
    ref.watch(authConttroler);

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ScannnBarcodeAddPage(
                    (capture) {
                  final List<Barcode> barcodes = capture.barcodes;

                  for (final barcode in barcodes) {
                    var barcodeValue = barcode.rawValue.toString();
                    if (scanCtr.barcodlar.contains(barcodeValue)) {
                      if (!ctr.savatBarcode.contains(barcodeValue)) {
                        for (var i = 0; i < scanCtr.barcodlar.length; ++i) {
                          if (scanCtr.barcodlar[i] == barcodeValue) {
                            ctr.savatAdd(box.values.toList()[i]);
                            ctr.count.add(1);
                            break;
                          }
                        }
                      } else {
                        // snakebar(context, "Bu Praduct Mavjud");
                      }
                    } else {
                      // snakebar(context, "Bunaqa Praduct Bazada Yo'q");
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
                height: MediaQuery.of(context).size.height * 0.50,
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
                          elevation: 2,
                          shadowColor: AppColorss.c_9745FF,
                          child: ListTile(
                            title: Text(
                              ctr.savat[index].barCode.toString(),
                              style: AppTextStyle.textStyle3,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ctr.savat[index].name,
                                  style: AppTextStyle.textPrces,
                                ),
                                Text(
                                  ctr.xotradagiSumma(ctr.savat[index].price),
                                  style: AppTextStyle.textStyle1_,
                                ),
                              ],
                            ),
                            trailing: WProductCount(
                              index: index,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const WCustomBottomNav(),
    );
  }
}