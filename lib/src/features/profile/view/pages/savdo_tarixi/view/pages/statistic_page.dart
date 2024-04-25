import 'dart:core';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/services/trade/get_trade.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/data/entity/products_model.dart';
import 'package:barcodbek/src/features/profile/view/pages/savdo_tarixi/controller/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavdoTarixPage extends ConsumerWidget {
  const SavdoTarixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColorss.scaffoldColor,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
        return SizedBox(
          height: 200,
          child: SavdoItem());
      }),
    );
  }
}

class SavdoItem extends ConsumerWidget {
  const SavdoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(historyController);
    var ctr = ref.read(historyController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text('Bugun', style: AppTextStyle.textStyle11),
        ),
        WGap.gap10,
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorss.c_FFFFFF,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 30,
                spreadRadius: 1,
              )
            ],
          ),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: GetTradeServices.bugun.length,
                itemBuilder: (context, index) {
                  var item = GetTradeServices.list[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WText(
                          item.createdAt,
                          style: AppTextStyle.textStyle4,
                        ),
                        WText(
                          formatNumber(int.parse(item.totalAmount.replaceAll('.00', ' '))),
                          style: AppTextStyle.textStyle4_,
                        ),
                      ],
                    ),
                  );
                },
              ),
              WText(
                umumiSumma(),
                style: AppTextStyle.textStyle4_,
              )
            ],
          ),
        )
      ],
    );
  }

  String umumiSumma() {
    int total = 0;
    for (var i = 0; i < GetTradeServices.list.length; ++i) {
      total += int.parse(GetTradeServices.list[i].totalAmount.replaceAll(".00", " "));
    }
    return formatNumber(total);
  }

  String formatNumber(int number) {
    String strNumber = number.toString();
    String formattedNumber = '';
    int length = strNumber.length;
    for (int i = 0; i < length; i++) {
      if ((length - i) % 3 == 0 && i != 0) {
        formattedNumber += ' ';
      }
      formattedNumber += strNumber[i];
    }
    return formattedNumber;
  }
}

String dateFormat(String date) {
  String day = DateTime.now().toIso8601String().substring(8, 10);
  if (date.substring(8, 10) == day) {
    return "Bugun";
  }
  if (date.substring(8, 10) == (int.parse(day) - 1).toString()) {
    return "Kecha";
  }
  return date;
}

class TaxrixMadel {
  final String data;
  final List<ProductsModel> praduct;

  const TaxrixMadel({required this.data, required this.praduct});
}
