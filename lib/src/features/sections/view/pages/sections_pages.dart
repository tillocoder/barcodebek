import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/sections/view/pages/calculating.dart';
import 'package:barcodbek/src/features/sections/view/pages/deptors.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending.dart';
import 'package:barcodbek/src/features/sections/view/pages/searching.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell.dart';
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
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          index == 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SellPages(),
                            ),
                          );
                        case 1:
                          index == 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchingPages(),
                            ),
                          );
                        case 2:
                          index == 2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalculatingPages(),
                            ),
                          );
                        case 3:
                          index == 3;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeptorsPages(),
                            ),
                          );
                        case 4:
                          index == 4;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LendingPages(),
                            ),
                          );
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(194, 147, 255, 1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(112, 0, 255, 0.22),
                            spreadRadius: 6,
                            blurRadius: 6,
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
