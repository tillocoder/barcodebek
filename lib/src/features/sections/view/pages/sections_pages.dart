import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/app_images.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/sections/view/pages/calculating.dart';
import 'package:barcodbek/src/features/sections/view/pages/deptors.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending.dart';
import 'package:barcodbek/src/features/sections/view/pages/searching.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell.dart';
import 'package:flutter/material.dart';

class SectionsPages extends StatelessWidget {
  const SectionsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Words.categories.tr(context),
          style: AppTextStyle.textStyle2,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.70,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 30,
                  // crossAxisSpacing: 40,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 18),
                    child: wSWButton(
                      index: index,
                      page: [
                        const TovarQoshish(),
                        const SearchingPages(),
                        const CalculatingPages(),
                        const DeptorsPages(),
                        const LendingPages(),
                      ],
                      context: context,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            listIcons[index],
                            Text(
                              listText[index].tr(context),
                              style: AppTextStyle.textStyle9, // Corrected usage
                            )
                          ],
                        ),
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

InkWell wSWButton({
  required int index,
  required List<Widget> page,
  required BuildContext context,
  required Widget child,
}) {
  return InkWell(
    onTap: () {
      for (var i = 0; i < page.length; i++) {
        if (index == i) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => page[i],
            ),
          );
        }
      }
    },
    child: child,
  );
}

List<Widget> listIcons = [
  AppImages.sell,
  AppImages.bsearch,
  AppImages.count,
  AppImages.debtors,
  AppImages.lending,
];

List<Words> listText = [
  Words.selling,
  Words.search,
  Words.calculation,
  Words.debtors,
  Words.lending,
];
