import 'dart:core';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/data/entity/sacanner.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/controller/edit_controller.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/view/widgets/w_bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavdoTarixPage extends StatelessWidget {

  const SavdoTarixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorss.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const WBeacButton(
                isChec: true,
                title: 'Sado Tarixi',
              ),
              WGap.gap10,
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: savdoList.length,
                    itemBuilder: (context, index) {
                      return SavdoItem(model: savdoList[index]);
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
}

class SavdoItem extends ConsumerWidget {
  final TaxrixMadel model;

  const SavdoItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(dateFormat(model.data), style: AppTextStyle.textStyle11),
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.praduct.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WText(
                          model.praduct[index].name,
                          style: AppTextStyle.textStyle4,
                        ),
                        WText(
                          model.praduct[index].price,
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
    for (var i = 0; i < model.praduct.length; ++i) {
      total += int.parse(model.praduct[i].price.replaceAll(" ", ""));
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
  final List<ScannModelPrice> praduct;

  const TaxrixMadel({required this.data, required this.praduct});
}
