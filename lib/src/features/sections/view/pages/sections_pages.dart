import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';

class SectionsPages extends StatelessWidget {
  const SectionsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bo’limlar",
          style: AppTextStyle.textStyle2,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.68,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 40,
                ),
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 130,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(194, 147, 255, 1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(112, 0, 255, 0.22),
                            spreadRadius: 7,
                            blurRadius: 6,
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          listIcons.elementAt(index),
                          Text(
                            listText[index],
                            style: AppTextStyle.textStyle9, // Corrected usage
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> listIcons = [
  AppIcons.sell,
  AppIcons.bsearch,
  AppIcons.count,
  AppIcons.debtors,
  AppIcons.lending
];

List<String> listText = [
  "Sotish",
  "Qidirish",
  "Hisoblash",
  "Qarzdorlar",
  "Qarz Berish"
];
