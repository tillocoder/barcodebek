import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PricesPages extends ConsumerWidget {
  const PricesPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scannController);
    var con = ref.read(scannController);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: WBeacButton(
                isChec: false,
                title: Words.prices.tr(context),
              ),
            ),
            WGap.gap20,
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: con.scannModelPrice.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 10,
                      right: 10,
                      bottom: 4,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: AppColorss.shadow,
                            blurRadius: 15,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const WText(
                                '90000',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          title: const WText('Gurgut'),
                          subtitle: const Row(
                            children: [
                              Text(
                                '7324897293',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 5),
                              WText(
                                '10.20.2023',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Umumiy \n Mahsulotlarning Narxi",
                      style: AppTextStyle.textStyle5,
                      textAlign: TextAlign.center,
                    ),
                    WGap.gap10,
                    Text(
                      "113.500.000",
                      style: AppTextStyle.textStyle1__,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 80,
                      height: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColorss.c_9745FF,
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              spreadRadius: 0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Yopish",
                            style: AppTextStyle.textStyle6,
                        child: SizedBox(
                          height: 80,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      con.scannModelPrice[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      con.scannModelPrice[index].price,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppColorss.c_9745FF,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        con.deleteProduct(index);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      con.scannModelPrice[index].barcode,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      con.scannModelPrice[index].dateTime,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
        child: AppIcons.sell,
      ),
    );
  }
}
