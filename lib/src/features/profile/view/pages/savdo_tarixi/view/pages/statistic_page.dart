import 'dart:core';

import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:flutter/material.dart';

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
                    itemCount: model.length,
                    itemBuilder: (context, index) {
                      return SavdoItem(model: model[index]);
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

class SavdoItem extends StatelessWidget {
  final TaxrixMadel model;

  const SavdoItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        Text(
                          '${model.praduct[index].name}',
                          style: AppTextStyle.textStyle4,
                        ),
                        Text(
                          '${model.praduct[index].prices}',
                          style: AppTextStyle.textStyle4_,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                umumiSumma().toString(),
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
      total += int.parse(model.praduct[i].prices.replaceAll(" ", ""));
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

List<TaxrixMadel> model = [
  TaxrixMadel(
    data: DateTime.now().toIso8601String().substring(0, 10),
    praduct: [
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "anor", prices: '9 000'),
      const Praduct(name: "nok", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '10 000'),
      const Praduct(name: "Olma", prices: '1 000'),
      const Praduct(name: "Olma", prices: '88 000'),
    ],
  ),
  const TaxrixMadel(
    data: '2024-03-18',
    praduct: [
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "anor", prices: '9 000'),
      Praduct(name: "nok", prices: '10 000'),
      Praduct(name: "Olma", prices: '845 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '999000'),
    ],
  ),
  const TaxrixMadel(
    data: '2024-03-17',
    praduct: [
      Praduct(name: "Olma", prices: '1 000'),
      Praduct(name: "anor", prices: '10 000'),
      Praduct(name: "nok", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
    ],
  ),
  const TaxrixMadel(
    data: '2024-03-17',
    praduct: [
      Praduct(name: "Olma", prices: '1 000'),
      Praduct(name: "anor", prices: '10 000'),
      Praduct(name: "nok", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
      Praduct(name: "Olma", prices: '10 000'),
    ],
  ),
];

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
  final List<Praduct> praduct;

  const TaxrixMadel({required this.data, required this.praduct});
}

class Praduct {
  final String name;
  final String prices;

  const Praduct({required this.name, required this.prices});
}