import 'package:barcodbek/main.dart';
import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/services/debtors/get_services.dart';
import 'package:barcodbek/src/core/services/debtors/post_services.dart';
import 'package:barcodbek/src/core/services/products/get_products.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/data/entity/debtor_user_model.dart';
import 'package:barcodbek/src/features/auth/view/widgets/wtext_fild.dart';
import 'package:barcodbek/src/features/sections/controller/bosilganda.dart';
import 'package:barcodbek/src/features/sections/view/pages/Deptors.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/controller/db_lending_ctr.dart';
import 'package:barcodbek/src/features/sections/view/pages/lending/view/widgets/calendar.dart';
import 'package:barcodbek/src/features/sections/view/pages/sell/controller/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int index1 = 0;

class LendingPages extends ConsumerWidget {
  const LendingPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var con = ref.read(deptorsController);
    var ctrlending = ref.read(lendingController);
    var sellCtr = ref.read(sellController);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Column(
              children: [
                WBeacButton(
                  isChec: true,
                  title: Words.lending.tr(context),
                ),
                WGap.gap15,
                Column(
                  children: [
                    WTextFild(
                      controller: ctrlending.ismFamilya,
                      hintText: Words.name_surname.tr(context),
                    ),
                    WGap.gap20,
                    WTextFild(
                      controller: ctrlending.phoneNumber,
                      hintText: Words.phone_number.tr(context),
                    ),
                    WGap.gap20,
                    WTextFild(
                      controller: ctrlending.qoshimcha,
                      hintText: Words.received_products.tr(context),
                    ),
                    WGap.gap10,
                    const Calendar(),
                    WGap.gap10
                  ],
                ),
                WElevatedButton(
                  text: Words.save.tr(context),
                  onPressed: () async {
                    // String qarzmuddati;
                    // if (ctrcalendar.rangeEnd != null) {
                    //   qarzmuddati = ctrcalendar.rangeEnd.toString();
                    // } else {
                    //   qarzmuddati = ctrcalendar.focusedDay.toString();
                    // }
                    if (ctrlending.ismFamilya.text.isNotEmpty &&
                        ctrlending.phoneNumber.text.isNotEmpty &&
                        ctrlending.qoshimcha.text.isNotEmpty) {
                      List<Product> productModel = [];
                      for (var i = 0; i < sellCtr.savat.length; ++i) {
                        productModel.add(
                          Product(
                            barCode: sellCtr.savat[i].barCode.toDouble(),
                            number: sellCtr.count[i],
                          ),
                        );
                      }
                      await PostDebTorsServices.POST(
                        DebtorUser(
                          fullName: ctrlending.ismFamilya.text,
                          phoneNumber: ctrlending.phoneNumber.text,
                          comment: ctrlending.qoshimcha.text,
                          products: [...productModel],
                        ),
                      );
                    }
                    await GetDebtorsServices.GET();
                    sellCtr.yaglash();
                    con.isChecked.add(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeptorsPages(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
