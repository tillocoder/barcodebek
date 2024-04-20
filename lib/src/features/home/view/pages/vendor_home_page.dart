import 'package:barcodbek/keraksiz.dart';
import 'package:barcodbek/kk.dart';
import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/home/controller/homeController.dart';
import 'package:barcodbek/src/features/home/view/pages/owner_home_page.dart';
import 'package:barcodbek/src/features/home/view/widgets/performance.dart';
import 'package:barcodbek/src/features/home/view/widgets/w_card_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorPage extends ConsumerWidget {
  const VendorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var ctrhome = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: userT
            ? IconButton(
                onPressed: () async {
                  await GetDebtorsServices.GET();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KeraksizPages()));
                },
                icon: AppIcons.notification,
              )
            : const SizedBox.shrink(),
        centerTitle: true,
        title: Text(
          boxUser.values.toList()[0].firstName,
          style: AppTextStyle.textStyle1_,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WGap.gap20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: WCard2(text1: 'Bugungi savdoyingiz', text2: '8000000'),
              ),
              WGap.gap20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: WCard2(
                    text1: 'Bugungi bergan qarzlaringiz', text2: '213000'),
              ),
              WGap.gap20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              spreadRadius: 1)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            'Qarzdorlar ro\'yhati',
                            style: AppTextStyle.textStyle4,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ctrhome.list.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  hehe(ctrhome.list[index])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              WGap.gap20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              spreadRadius: 1)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            'Hamkasblar',
                            style: AppTextStyle.textStyle4_,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ctrhome.hList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  haha(ctrhome.hList[index])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              WGap.gap10,
            ],
          ),
        ),
      ),
    );
  }
}
