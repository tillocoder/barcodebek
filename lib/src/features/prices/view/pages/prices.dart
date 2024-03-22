import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/features/scanner/controller/scan_controller.dart';
import 'package:flutter/cupertino.dart';
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
    );
  }
}
