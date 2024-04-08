import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/prices/controller/prices_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PricesPages extends ConsumerWidget {
  const PricesPages({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pricesController);

    var ctr = ref.read(pricesController);

    return Scaffold(
      backgroundColor: AppColorss.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 Text("Umumiy Mahsulotlarning Narxi",style: AppTextStyle.textStyle4,),
                                Text(umumiSumma(),style: AppTextStyle.textStyle1_,),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.monetization_on_rounded,color: AppColorss.c_9745FF,),
                  ),
                  Text(
                    Words.prices.tr(context),
                    style: AppTextStyle.textStyle2,
                  ),
                  AppIcons.search,
                ],
              ),
              WGap.gap25,
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColorss.c_FFFFFF,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  color: AppColorss.c_D6BEFF,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  box.values.toList()[index].name,
                                  style: AppTextStyle.textPrces,
                                ),
                                subtitle: Text(
                                  box.values.toList()[index].barCode.toString(),
                                  style: AppTextStyle.textBarcode,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          pricesCalculating(
                                              box.values.toList()[index].price),
                                          style: AppTextStyle.textNarxi,
                                        ),
                                        Text(
                                          box.values.toList()[index].createdAt.toString(),
                                          style: AppTextStyle.textDateTime,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ctr.removIndex(index);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.delete,
                                        color: AppColorss.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String umumiSumma() {
    int total = 0;
    for (var i = 0; i < box.values.length; ++i) {
      total += int.parse(box.values.toList()[i].price);
    }
    return pricesCalculating(total.toString());
  }
}

String pricesCalculating(String number) {
  String strNumber = number;
  String formattedNumber = '';
  int length = strNumber.length;
  for (int i = 0; i < length; i++) {
    if ((length - i) % 3 == 0 && i != 0) {
      formattedNumber += '.';
    }
    formattedNumber += strNumber[i];
  }
  return formattedNumber;
}
