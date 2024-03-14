import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.68,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
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
                            offset: Offset(2, 3),
                            color: Color.fromRGBO(112, 0, 255, 0.22),
                            spreadRadius: 3,
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset('assets/icons/bolimlar/sell.svg'),
                          Text(
                            listText[index],
                            style: AppTextStyle.textStyle1, // Corrected usage
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

List listIcons = [
  AppIcons.sell,
  AppIcons.search_b,
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
