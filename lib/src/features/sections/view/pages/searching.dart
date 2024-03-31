import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/camera.dart';
import 'package:barcodbek/src/features/scanner/view/widgets/flash.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:svg_flutter/svg.dart';

class SearchingPages extends ConsumerWidget {
  const SearchingPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var ctr = ref.read(scannController);
    ref.watch(sellController);
    var sellCtr = ref.read(sellController);
    return Scaffold(
      body: ctr.disposeScanner1
          ? Stack(
              children: [
                Expanded(
                  child: ScannnBarcodeAddPage(
                    (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      var barcodeValue;
                      for (var barcode in barcodes) {
                        barcodeValue = barcode.rawValue.toString();
                        for (var i = 0; i < ctr.barcodlar.length; ++i) {
                          if (ctr.barcodlar[i].contains(barcodeValue)) {
                            ctr.isCheck();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Nomi: ",
                                            style: AppTextStyle.textStyle4,
                                          ),
                                          Text(
                                            " ${box.values.toList()[i].name}",
                                            style: AppTextStyle.textStyle1__,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Narxi: ",
                                            style: AppTextStyle.textStyle4,
                                          ),
                                          Text(
                                            " ${sellCtr.xotradagiSumma(box.values.toList()[i].price)}",
                                            style: AppTextStyle.textStyle1__,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Barcode: ",
                                            style: AppTextStyle.textStyle4,
                                          ),
                                          Text(
                                            " ${box.values.toList()[i].barcode}",
                                            style: AppTextStyle.textStyle1__,
                                          ),
                                        ],
                                      ),
                                      WGap.gap10,
                                      SizedBox(
                                        height: 40,
                                        child: WElevatedButton(
                                          text: "Yopish",
                                          onPressed: () {
                                            ctr.isCheck();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }
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
                  alignment: Alignment.topLeft,
                  child: SafeArea(
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
